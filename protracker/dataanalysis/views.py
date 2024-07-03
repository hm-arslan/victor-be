from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.authentication import SessionAuthentication, TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.renderers import JSONRenderer
from fileupload.serializers import FileUploadSerializer, DataUploadSerializer
from django.http import JsonResponse
from django.db.models import Sum, F, Value, IntegerField
from django.db.models.functions import Cast

from fileupload.models import DataUpload, \
    FileUpload, \
    RotatorCuffPathology, \
    PrevalenceOfNeerThreeOrFour_partProximalHumeralFractureByAgeAndSex,\
    AnatomicTotalShoulderArthroplastyByIndication,\
    ReverseTotalShoulderArthroplastyByIndication,\
    ShoulderArthroplastyByComplication,\
    ShoulderArthroplastyByAge,\
    ShoulderArthroplastyRevisionRateByAge,\
    ShoulderArthroplastyBySex,\
    ShoulderArthroplastyRevisionRateBySex,\
    HemiarthroplastyByAgeAndSex,\
    HemiarthroplastyByIndication,\
    AnatomicTotalShoulderArthroplastyByAgeAndSex,\
    ReverseTotalShoulderArthroplastyByAgeAndSex,\
    ProsthesisCompanyFrequency,\
    ProsthesisCompanyFrequencyByIndication,\
    RevisionRatesOfProsthesisCompany,\
    PrevalenceOfPatientsWithRotatorcuffPathologyWith_GreaterEqual_1_comorbiditieByAgeAndSex


import os
import pandas as pd


@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
@api_view(['GET'])
def get_files(request):
    queryset = FileUpload.objects.all()
    serializer = FileUploadSerializer(queryset, many=True)

    return Response(serializer.data)

@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
@api_view(['GET'])
def delete_files(request, file_id):
    try:
        file_to_delete = FileUpload.objects.get(pk=file_id)
    except FileUpload.DoesNotExist:
        return JsonResponse({'error': 'File does not exist'}, status=404)

    # Delete associated data uploads
    data_uploads = DataUpload.objects.filter(file=file_to_delete)
    for data_upload in data_uploads:
        data_upload.delete()

    # Delete file from disk
    file_path = file_to_delete.file_path.path
    if os.path.exists(file_path):
        os.remove(file_path)

    # Delete file object
    file_to_delete.delete()

    return JsonResponse({'message': 'File and associated data deleted successfully'}, status=200)

@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
@api_view(['GET'])
def get_data(request):
    queryset = DataUpload.objects.all()
    serializer = DataUploadSerializer(queryset, many=True)

    return Response(serializer.data)

@api_view(['GET'])
def get_trends(request):
    queryset = DataUpload.objects.all()
    data = pd.DataFrame(list(queryset.values()))
    # print(data)
    age_bins = [0, 65, 200]
    age_labels = ['0-65', '65-200']

    data['age'] = data['age'].astype(int)

    data['Age Group'] = pd.cut(data['age'], bins=age_bins, labels=age_labels, right=False)

    # print(data['Age Group'])
    prevalence = data.groupby(['Age Group', 'sex']).size().reset_index(name='Count')
    prevalence_dict = prevalence.to_dict(orient='records')

    return Response(prevalence_dict)

@api_view(['GET'])
def prevalence_by_age_group_and_disease(request):
    queryset = DataUpload.objects.all()
    data = pd.DataFrame(list(queryset.values()))
    # print(data)
    # age_bins = [0, 65, 200]
    # age_labels = ['0-65', '65-200']

    # Define age groups
    age_bins = [0, 20, 40, 60, 80, 100]
    age_labels = ['0-20', '20-40', '40-60', '60-80', '80-100']

    data['age'] = data['age'].astype(int)

    # Create Age Group column based on age_bins and age_labels
    data['Age Group'] = pd.cut(data['age'], bins=age_bins, labels=age_labels, right=False)

    # Group data by age group and indication, and count occurrences
    prevalence_by_age_group_and_disease = data.groupby(['Age Group', 'indications']).size().reset_index(name='Count')

    prevalence_by_age_group_and_disease = prevalence_by_age_group_and_disease.to_dict(orient='records')

    return Response(prevalence_by_age_group_and_disease)


@api_view(['GET'])
def prevalence_of_pathologies(request):

    # Data
    x_values = ['Supraspinatus', 'Infraspinatus', 'Subscapularis', 'Teres Minor', 'Long Head of Biceps', 'Subacromial Pathology Other']
    y_values = [86, 12, 29, 25, 35, 63]
    
    # Serialize data
    data = []
    for name, prevalence in zip(x_values, y_values):
        data.append({'name': name, 'prevalence': prevalence})
    
    print(data)
    json_data = {'pathology_data': data}

    return Response(json_data)


@api_view(['GET'])
def incidence_of_fracture_by_age_group(request):
    
    queryset = DataUpload.objects.all()
    data = pd.DataFrame(list(queryset.values()))

    # Define age groups
    age_bins = [0, 20, 40, 60, 80, 100]
    age_labels = ['0-20', '21-40', '41-60', '61-80', '81-100']

    data['age'] = data['age'].astype(int)

    # Create Age Group column based on age_bins and age_labels
    data['Age Group'] = pd.cut(data['age'], bins=age_bins, labels=age_labels, right=False)

    # Filter data for upper extremity fractures
    upper_extremity_fractures = ['Rotator cuff', 'PHF', 'Reverse Fractur', 'Placa de Hombro', 'Recon Humeral']
    upper_extremity_df = data[data['indications'].isin(upper_extremity_fractures)]

    # Group by age group and count occurrences
    incidence_by_age_group = upper_extremity_df.groupby(['Age Group']).size().reset_index(name='Incidence')

    incidence_by_age_group = incidence_by_age_group.to_dict(orient='records')

    return Response(incidence_by_age_group)

@api_view(['GET'])
def prevalence_by_sex_age_group_prosthesis(request):
    
    queryset = DataUpload.objects.all()
    data = pd.DataFrame(list(queryset.values()))

    # Define age groups
    age_bins = [0, 20, 40, 60, 80, 100]
    age_labels = ['0-20', '21-40', '41-60', '61-80', '81-100']

    
    data['age'] = data['age'].astype(int)

    # Create Age Group column based on age_bins and age_labels
    data['Age Group'] = pd.cut(data['age'], bins=age_bins, labels=age_labels, right=False)

    # Group by sex, age group, and prosthesis type, then count occurrences
    prevalence_by_sex_age_group_prosthesis = data.groupby(['sex', 'Age Group', 'prothesis_type']).size().reset_index(name='Prevalence')

    prevalence_by_sex_age_group_prosthesis = prevalence_by_sex_age_group_prosthesis.to_dict(orient='records')

    return Response(prevalence_by_sex_age_group_prosthesis)


@api_view(['GET'])
def prosthesis_by_indication(request):
    
    queryset = DataUpload.objects.all()
    data = pd.DataFrame(list(queryset.values()))

    # Group by indication and prosthesis type, then count occurrences
    prosthesis_by_indication = data.groupby(['indications', 'prothesis_type']).size().reset_index(name='Count')

    prosthesis_by_indication = prosthesis_by_indication.to_dict(orient='records')

    return Response(prosthesis_by_indication)




@api_view(['GET'])
def get_trends_by_agerange(request):
    queryset = DataUpload.objects.all()
    df = pd.DataFrame(list(queryset.values()))

    # Debugging: Print data types of columns
    print(df.dtypes)

    # Debugging: Print unique values in 'sex' column
    print(df['sex'].unique())

    # Debugging: Print unique values in 'age_group' column
    print(df['age_group'].unique())

    # Define age ranges
    age_labels = ['0-45', '45-60', '60-90']
    age_bins = [0, 45, 60, 90]


    # Convert 'age' column to numeric type, handling errors
    df['age'] = pd.to_numeric(df['age'], errors='coerce')

    # Create 'age_group' column based on age ranges
    df['age_group'] = pd.cut(df['age'], bins=age_bins, labels=age_labels, right=False)

    # Check if 'age_group' column is properly created
    print(df['age_group'].head())


    # Drop rows with NaN values in 'age_group' (if any)
    df = df.dropna(subset=['age_group'])


    # Group data by gender and age group, and count the occurrences
    grouped_data = df.groupby(['sex', 'age_group']).size().unstack()
    # Convert DataFrame to dictionary for JSON serialization
    trends_dict = grouped_data.to_dict()
    return Response(trends_dict)


# def get_prevalence_by_age(request, disease_name):
#     # Filter data for the particular disease
#     queryset = DataUpload.objects.filter(indications=disease_name)

#     # Convert queryset to DataFrame
#     df = pd.DataFrame(list(queryset.values()))

#     # Group the data by age and count occurrences
#     prevalence_by_age = df.groupby('age').size().reset_index(name='Count')

#     # Convert DataFrame to dictionary
#     prevalence_dict = prevalence_by_age.set_index('age').to_dict()['Count']

#     # Return the dictionary as a Response object
#     response = Response(prevalence_dict)

#     # Set renderer classes on the view
#     response.accepted_renderer = JSONRenderer()
#     response.accepted_media_type = JSONRenderer.media_type
#     response.renderer_context = {}

#     return response

@api_view(['GET'])
def get_rotatorcuff_pathologies_with_counts(request):
    # Aggregate count values for similar pathologies
    pathologies_data = RotatorCuffPathology.objects.values('pathologies').annotate(
        total_count=Sum(Cast('count', IntegerField()))
    )
    # Convert the aggregated data to a list of dictionaries
    response_data = list(pathologies_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)

@api_view(['GET'])
def get_prevalence_of_Neer3_by_age_and_sex(request):
    # Aggregate count values for different age groups by sex
    prevalence_data = PrevalenceOfNeerThreeOrFour_partProximalHumeralFractureByAgeAndSex.objects.values('sex__sex').annotate(
        total_zero_19=Sum(Cast('zero_19', IntegerField())),
        total_twenty_39=Sum(Cast('twenty_39', IntegerField())),
        total_forty_59=Sum(Cast('forty_59', IntegerField())),
        total_sixty_79=Sum(Cast('sixty_79', IntegerField())),
        total_greaterThan_80=Sum(Cast('greaterThan_80', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(prevalence_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)

@api_view(['GET'])
def get_shoulder_arthroplasty_by_indication(request):
    # Aggregate count values for different indications
    arthroplasty_data = AnatomicTotalShoulderArthroplastyByIndication.objects.values('indication__indication').annotate(
        total_number=Sum(Cast('number', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(arthroplasty_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)

@api_view(['GET'])
def get_reverse_shoulder_arthroplasty_by_indication(request):
    # Aggregate count values for different indications
    reverse_arthroplasty_data = ReverseTotalShoulderArthroplastyByIndication.objects.values('indication__indication').annotate(
        total_number=Sum(Cast('number', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(reverse_arthroplasty_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)

@api_view(['GET'])
def get_shoulder_arthroplasty_by_complication(request):
    # Aggregate count values for different complications
    complication_data = ShoulderArthroplastyByComplication.objects.values('complication__complication').annotate(
        total_hemiarthroplasty=Sum(Cast('Hemiarthroplasty', IntegerField())),
        total_anatomic_total_shoulder_arthroplasty=Sum(Cast('AnatomicTotalShoulderArthroplasty', IntegerField())),
        total_reverse_total_shoulder_arthroplasty=Sum(Cast('ReverseTotalShoulderArthroplasty', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(complication_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)

@api_view(['GET'])
def get_shoulder_arthroplasty_by_age(request):
    # Aggregate count values for different age groups
    age_data = ShoulderArthroplastyByAge.objects.values('age__agegroup').annotate(
        total_hemiarthroplasty=Sum(Cast('Hemiarthroplasty', IntegerField())),
        total_anatomic_total_shoulder_arthroplasty=Sum(Cast('AnatomicTotalShoulderArthroplasty', IntegerField())),
        total_reverse_total_shoulder_arthroplasty=Sum(Cast('ReverseTotalShoulderArthroplasty', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(age_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)

@api_view(['GET'])
def get_shoulder_arthoplasty_revision_rate_by_age(request):
    # Aggregate count values for different age groups
    revision_rate_data = ShoulderArthroplastyRevisionRateByAge.objects.values('age__agegroup').annotate(
        total_hemiarthroplasty=Sum(Cast('Hemiarthroplasty', IntegerField())),
        total_anatomic_total_shoulder_arthroplasty=Sum(Cast('AnatomicTotalShoulderArthroplasty', IntegerField())),
        total_reverse_total_shoulder_arthroplasty=Sum(Cast('ReverseTotalShoulderArthroplasty', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(revision_rate_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)

@api_view(['GET'])
def get_shoulder_arthroplasty_by_sex(request):
    # Aggregate count values for different sexes
    sex_data = ShoulderArthroplastyBySex.objects.values('sex__sex').annotate(
        total_hemiarthroplasty=Sum(Cast('Hemiarthroplasty', IntegerField())),
        total_anatomic_total_shoulder_arthroplasty=Sum(Cast('AnatomicTotalShoulderArthroplasty', IntegerField())),
        total_reverse_total_shoulder_arthroplasty=Sum(Cast('ReverseTotalShoulderArthroplasty', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(sex_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)

@api_view(['GET'])
def get_shoulder_arthoplasty_revision_rate_by_sex(request):
    # Aggregate count values for different sexes
    sex_revision_rate_data = ShoulderArthroplastyRevisionRateBySex.objects.values('sex__sex').annotate(
        total_hemiarthroplasty=Sum(Cast('Hemiarthroplasty', IntegerField())),
        total_anatomic_total_shoulder_arthroplasty=Sum(Cast('AnatomicTotalShoulderArthroplasty', IntegerField())),
        total_reverse_total_shoulder_arthroplasty=Sum(Cast('ReverseTotalShoulderArthroplasty', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(sex_revision_rate_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)


@api_view(['GET'])
def get_hemiarthroplasty_by_age_and_sex(request):
    # Aggregate count values for different age groups by sex
    age_sex_data = HemiarthroplastyByAgeAndSex.objects.values('sex__sex').annotate(
        total_zero_19=Sum(Cast('zero_19', IntegerField())),
        total_twenty_39=Sum(Cast('twenty_39', IntegerField())),
        total_forty_59=Sum(Cast('forty_59', IntegerField())),
        total_sixty_79=Sum(Cast('sixty_79', IntegerField())),
        total_greater_than_80=Sum(Cast('greaterThan_80', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(age_sex_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)


@api_view(['GET'])
def get_hemiarthroplasty_by_indication(request):
    # Aggregate sum values for each indication
    indication_data = HemiarthroplastyByIndication.objects.values('indication__indication').annotate(
        total_number=Sum('number')
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(indication_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)
    

@api_view(['GET'])
def get_anatomic_total_shoulder_arthroplasty_by_age_and_sex(request):
    # Aggregate count values for different age groups by sex
    age_sex_data = AnatomicTotalShoulderArthroplastyByAgeAndSex.objects.values('sex__sex').annotate(
        total_zero_19=Sum(Cast('zero_19', IntegerField())),
        total_twenty_39=Sum(Cast('twenty_39', IntegerField())),
        total_forty_59=Sum(Cast('forty_59', IntegerField())),
        total_sixty_79=Sum(Cast('sixty_79', IntegerField())),
        total_greater_than_80=Sum(Cast('greaterThan_80', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(age_sex_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)

@api_view(['GET'])
def get_reverse_total_shoulder_arthroplasty_by_age_and_sex(request):
    # Aggregate count values for different age groups by sex
    age_sex_data = ReverseTotalShoulderArthroplastyByAgeAndSex.objects.values('sex__sex').annotate(
        total_zero_19=Sum(Cast('zero_19', IntegerField())),
        total_twenty_39=Sum(Cast('twenty_39', IntegerField())),
        total_forty_59=Sum(Cast('forty_59', IntegerField())),
        total_sixty_79=Sum(Cast('sixty_79', IntegerField())),
        total_greater_than_80=Sum(Cast('greaterThan_80', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(age_sex_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)


@api_view(['GET'])
def get_prosthesis_company_frequency_by_age_group(request):
    # Aggregate count values for different companies by age group
    age_group_data = ProsthesisCompanyFrequency.objects.values('age_group__agegroup').annotate(
        total_arthrex=Sum(Cast('arthrex', IntegerField())),
        total_depuy_synthes=Sum(Cast('depuy_synthes', IntegerField())),
        total_smith_nephew=Sum(Cast('smith_nephew', IntegerField())),
        total_stryker=Sum(Cast('stryker', IntegerField())),
        total_zimmer_biomet=Sum(Cast('zimmer_biomet', IntegerField())),
        total_exacthech=Sum(Cast('exacthech', IntegerField())),
        total_lima=Sum(Cast('lima', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(age_group_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)

@api_view(['GET'])
def get_prosthesis_company_frequency_by_indication(request):
    # Aggregate count values for different companies by indication
    indication_data = ProsthesisCompanyFrequencyByIndication.objects.values('indication__indication').annotate(
        total_arthrex=Sum(Cast('arthrex', IntegerField())),
        total_depuy_synthes=Sum(Cast('depuy_synthes', IntegerField())),
        total_smith_nephew=Sum(Cast('smith_nephew', IntegerField())),
        total_stryker=Sum(Cast('stryker', IntegerField())),
        total_zimmer_biomet=Sum(Cast('zimmer_biomet', IntegerField())),
        total_exacthech=Sum(Cast('exacthech', IntegerField())),
        total_lima=Sum(Cast('lima', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(indication_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)


@api_view(['GET'])
def get_revision_rates_of_prosthesis_company_by_indication(request):
    # Aggregate count values for different companies by indication
    indication_data = RevisionRatesOfProsthesisCompany.objects.values('indication__indication').annotate(
        total_arthrex=Sum(Cast('arthrex', IntegerField())),
        total_depuy_synthes=Sum(Cast('depuy_synthes', IntegerField())),
        total_smith_nephew=Sum(Cast('smith_nephew', IntegerField())),
        total_stryker=Sum(Cast('stryker', IntegerField())),
        total_zimmer_biomet=Sum(Cast('zimmer_biomet', IntegerField())),
        total_exacthech=Sum(Cast('exacthech', IntegerField())),
        total_lima=Sum(Cast('lima', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(indication_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)

@api_view(['GET'])
def get_prevalence_of_rotatorcuff_pathology_with_comorbidities_by_age_and_sex(request):
    # Aggregate count values for different age groups by sex
    age_sex_data = PrevalenceOfPatientsWithRotatorcuffPathologyWith_GreaterEqual_1_comorbiditieByAgeAndSex.objects.values('sex__sex').annotate(
        total_zero_19=Sum(Cast('zero_19', IntegerField())),
        total_twenty_39=Sum(Cast('twenty_39', IntegerField())),
        total_forty_59=Sum(Cast('forty_59', IntegerField())),
        total_sixty_79=Sum(Cast('sixty_79', IntegerField())),
        total_greater_than_80=Sum(Cast('greaterThan_80', IntegerField()))
    )

    # Convert the aggregated data to a list of dictionaries
    response_data = list(age_sex_data)

    # Return the data as JSON to the front end
    return JsonResponse(response_data, safe=False)

