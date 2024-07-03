from rest_framework.authentication import SessionAuthentication, TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework import status
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.decorators import api_view, parser_classes, permission_classes, authentication_classes
from rest_framework.authentication import SessionAuthentication, TokenAuthentication
from django.db import transaction
from .models import FileUpload, \
    RotatorCuffPathology, \
    Sex, \
    Indication,\
    Complication,\
    AgeGroup
from .serializers import FileUploadSerializer, \
    DataUploadSerializer, \
    RotatorCuffPathologySerializer, \
    PrevalenceOfNeerThreeOrFour_partProximalHumeralFractureByAgeAndSexSerializer, \
    AnatomicTotalShoulderArthroplastyByIndicationSerializer,\
    ShoulderArthroplastyByComplicationSerializer,\
    ShoulderArthroplastyBySexSerializer,\
    ShoulderArthroplastyRevisionRateBySexSerializer,\
    ShoulderArthroplastyByAgeSerializer,\
    ShoulderArthroplastyRevisionRateByAgeSerializer,\
    ReverseTotalShoulderArthroplastyByIndicationSerializer
    

import csv


@api_view(['POST'])
@parser_classes([MultiPartParser, FormParser])
@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
def create_rotator_cuff_pathology(request):
    file_serializer = FileUploadSerializer(data=request.data)

    if file_serializer.is_valid():
        file = file_serializer.validated_data['file_path']

        uploaded_file = file_serializer.save(user=request.user)
        file_id = uploaded_file.id

        try:
            csv_data = []
            with open(uploaded_file.file_path.path, mode='r', encoding='utf-8-sig') as csv_file:
                file_content = csv_file.read().replace('\ufeff', '')
                csv_reader = csv.reader(file_content.splitlines())

                for row in csv_reader:
                    if row[0] != 'pathologies' and row[1] != 'count':
                        csv_data.append({
                            'pathologies': row[0],
                            'count': row[1]
                        })
            
            # print(csv_data)
            saved_data = []
            errors = []
            for row in csv_data:
                # print(row)
                # print(type(row))
                data_serializer = RotatorCuffPathologySerializer(data=row)

                if data_serializer.is_valid():
                    # print(data_serializer.validated_data)
                    try:
                        # file_instance = FileUpload.objects.get(id=file_id)
                        # instance = data_serializer.save(file=file_instance)
                        instance = data_serializer.save()
                        saved_data.append(data_serializer.data)
                        print('success')
                    except Exception as e:
                        errors.append(str(e))
                else:
                    errors.append(data_serializer.errors)
                
            print(saved_data)
            print(errors)
            
            return Response({"message": "CSV file processed successfully"}, status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)
    return Response(file_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@parser_classes([MultiPartParser, FormParser])
@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
def create_prevalence_Neer3_entry(request):
    file_serializer = FileUploadSerializer(data=request.data)

    if file_serializer.is_valid():
        uploaded_file = file_serializer.save(user=request.user)
        file_path = uploaded_file.file_path.path

        try:
            csv_data = []
            with open(file_path, mode='r', encoding='utf-8-sig') as csv_file:
                csv_reader = csv.reader(csv_file)
                headers = next(csv_reader)  # Skip the header row

                for row in csv_reader:
                    csv_data.append({
                        'sex': row[0],
                        '0-19': row[1],
                        '20-39': row[2],
                        '40-59': row[3],
                        '60-79': row[4],
                        '≥80': row[5],
                    })

            saved_data = []
            errors = []
            for row in csv_data:
                sex_value = row['sex']
                zero_19 = int(row['0-19'])
                twenty_39 = int(row['20-39'])
                forty_59 = int(row['40-59'])
                sixty_79 = int(row['60-79'])
                greater_than_80 = int(row['≥80'])

                sex, created = Sex.objects.get_or_create(sex=sex_value)

                data = {
                    'sex': sex.id,
                    'zero_19': zero_19,
                    'twenty_39': twenty_39,
                    'forty_59': forty_59,
                    'sixty_79': sixty_79,
                    'greaterThan_80': greater_than_80,
                }

                print('data', data)


                data_serializer = PrevalenceOfNeerThreeOrFour_partProximalHumeralFractureByAgeAndSexSerializer(data=data)

                if data_serializer.is_valid():
                    print('Serialized data', data_serializer.validated_data)
                    try:
                        instance = data_serializer.save(sex=sex)
                        saved_data.append(data_serializer.data)
                        print('Success')
                    except Exception as e:
                        errors.append(str(e))
                else:
                    errors.append(data_serializer.errors)

            return Response({"message": "CSV file processed successfully", "saved_data": saved_data, "errors": errors}, status=status.HTTP_201_CREATED)

        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)

    return Response(file_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@parser_classes([MultiPartParser, FormParser])
@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
def create_anatomic_total_shoulder_arthroplasty_entry(request):
    file_serializer = FileUploadSerializer(data=request.data)

    if file_serializer.is_valid():
        uploaded_file = file_serializer.save(user=request.user)
        file_path = uploaded_file.file_path.path

        try:
            csv_data = []
            with open(file_path, mode='r', encoding='utf-8-sig') as csv_file:
                csv_reader = csv.reader(csv_file)
                headers = next(csv_reader)  # Skip the header row

                for row in csv_reader:
                    csv_data.append({
                        'indication': row[0],
                        'number': row[1],
                    })

            saved_data = []
            errors = []
            for row in csv_data:
                indication_value = row['indication']
                number = int(row['number'])

                indication, created = Indication.objects.get_or_create(indication=indication_value)

                data = {
                    'indication': indication.id,
                    'number': number
                }

                data_serializer = AnatomicTotalShoulderArthroplastyByIndicationSerializer(data=data)

                if data_serializer.is_valid():
                    try:
                        instance = data_serializer.save(indication=indication)
                        saved_data.append(data_serializer.data)
                    except Exception as e:
                        errors.append(str(e))
                else:
                    errors.append(data_serializer.errors)

            return Response({"message": "CSV file processed successfully", "saved_data": saved_data, "errors": errors}, status=status.HTTP_201_CREATED)

        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)

    return Response(file_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@parser_classes([MultiPartParser, FormParser])
@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
def create_reverse_total_shoulder_arthroplasty_by_indication_entry(request):
    file_serializer = FileUploadSerializer(data=request.data)

    if file_serializer.is_valid():
        uploaded_file = file_serializer.save(user=request.user)
        file_path = uploaded_file.file_path.path

        try:
            csv_data = []
            with open(file_path, mode='r', encoding='utf-8-sig') as csv_file:
                csv_reader = csv.reader(csv_file)
                headers = next(csv_reader)  # Skip the header row

                for row in csv_reader:
                    csv_data.append({
                        'indication': row[0], 
                        'number': row[1],
                    })

            saved_data = []
            errors = []
            for row in csv_data:
                indication_name = row['indication']
                number = parse_int(row['number'])

                indication, created = Indication.objects.get_or_create(indication=indication_name)

                data = {
                    'indication': indication.id,
                    'number': number,
                }

                data_serializer = ReverseTotalShoulderArthroplastyByIndicationSerializer(data=data)

                if data_serializer.is_valid():
                    try:
                        instance = data_serializer.save(indication=indication)
                        saved_data.append(data_serializer.data)
                    except Exception as e:
                        errors.append(str(e))
                else:
                    errors.append(data_serializer.errors)

            return Response({"message": "CSV file processed successfully", "saved_data": saved_data, "errors": errors}, status=status.HTTP_201_CREATED)

        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)

    return Response(file_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


def parse_int(value):
    """Helper function to convert a string with commas to an integer."""
    return int(value.replace(',', ''))

@api_view(['POST'])
@parser_classes([MultiPartParser, FormParser])
@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
def create_shoulder_arthroplasty_by_complication_entry(request):
    file_serializer = FileUploadSerializer(data=request.data)

    if file_serializer.is_valid():
        uploaded_file = file_serializer.save(user=request.user)
        file_path = uploaded_file.file_path.path

        try:
            csv_data = []
            with open(file_path, mode='r', encoding='utf-8-sig') as csv_file:
                csv_reader = csv.reader(csv_file)
                headers = next(csv_reader)  # Skip the header row

                for row in csv_reader:
                    csv_data.append({
                        'complication': row[0],
                        'Hemiarthroplasty': row[1],
                        'AnatomicTotalShoulderArthroplasty': row[2],
                        'ReverseTotalShoulderArthroplasty': row[3],
                    })

            saved_data = []
            errors = []
            for row in csv_data:
                complication_value = row['complication']
                hemiarthroplasty = parse_int(row['Hemiarthroplasty'])
                anatomic_total_shoulder_arthroplasty = parse_int(row['AnatomicTotalShoulderArthroplasty'])
                reverse_total_shoulder_arthroplasty = parse_int(row['ReverseTotalShoulderArthroplasty'])

                complication, created = Complication.objects.get_or_create(complication=complication_value)

                data = {
                    'complication': complication.id,
                    'Hemiarthroplasty': hemiarthroplasty,
                    'AnatomicTotalShoulderArthroplasty': anatomic_total_shoulder_arthroplasty,
                    'ReverseTotalShoulderArthroplasty': reverse_total_shoulder_arthroplasty
                }

                data_serializer = ShoulderArthroplastyByComplicationSerializer(data=data)

                if data_serializer.is_valid():
                    try:
                        instance = data_serializer.save(complication=complication)
                        saved_data.append(data_serializer.data)
                    except Exception as e:
                        errors.append(str(e))
                else:
                    errors.append(data_serializer.errors)

            return Response({"message": "CSV file processed successfully", "saved_data": saved_data, "errors": errors}, status=status.HTTP_201_CREATED)

        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)

    return Response(file_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@parser_classes([MultiPartParser, FormParser])
@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
def create_shoulder_arthroplasty_by_sex_entry(request):
    file_serializer = FileUploadSerializer(data=request.data)

    if file_serializer.is_valid():
        uploaded_file = file_serializer.save(user=request.user)
        file_path = uploaded_file.file_path.path

        try:
            csv_data = []
            with open(file_path, mode='r', encoding='utf-8-sig') as csv_file:
                csv_reader = csv.reader(csv_file)
                headers = next(csv_reader)  # Skip the header row

                for row in csv_reader:
                    csv_data.append({
                        'sex': row[0],
                        'Hemiarthroplasty': row[1],
                        'AnatomicTotalShoulderArthroplasty': row[2],
                        'ReverseTotalShoulderArthroplasty': row[3],
                    })

            saved_data = []
            errors = []
            for row in csv_data:
                sex_value = row['sex']
                hemiarthroplasty = parse_int(row['Hemiarthroplasty'])
                anatomic_total_shoulder_arthroplasty = parse_int(row['AnatomicTotalShoulderArthroplasty'])
                reverse_total_shoulder_arthroplasty = parse_int(row['ReverseTotalShoulderArthroplasty'])

                sex, created = Sex.objects.get_or_create(sex=sex_value)

                data = {
                    'sex': sex.id,
                    'Hemiarthroplasty': hemiarthroplasty,
                    'AnatomicTotalShoulderArthroplasty': anatomic_total_shoulder_arthroplasty,
                    'ReverseTotalShoulderArthroplasty': reverse_total_shoulder_arthroplasty
                }

                data_serializer = ShoulderArthroplastyBySexSerializer(data=data)

                if data_serializer.is_valid():
                    try:
                        instance = data_serializer.save(sex=sex)
                        saved_data.append(data_serializer.data)
                    except Exception as e:
                        errors.append(str(e))
                else:
                    errors.append(data_serializer.errors)

            return Response({"message": "CSV file processed successfully", "saved_data": saved_data, "errors": errors}, status=status.HTTP_201_CREATED)

        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)

    return Response(file_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@parser_classes([MultiPartParser, FormParser])
@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
def create_shoulder_arthroplasty_revision_rate_by_sex_entry(request):
    file_serializer = FileUploadSerializer(data=request.data)

    if file_serializer.is_valid():
        uploaded_file = file_serializer.save(user=request.user)
        file_path = uploaded_file.file_path.path

        try:
            csv_data = []
            with open(file_path, mode='r', encoding='utf-8-sig') as csv_file:
                csv_reader = csv.reader(csv_file)
                headers = next(csv_reader)  # Skip the header row

                for row in csv_reader:
                    csv_data.append({
                        'sex': row[0],
                        'Hemiarthroplasty': row[1],
                        'AnatomicTotalShoulderArthroplasty': row[2],
                        'ReverseTotalShoulderArthroplasty': row[3],
                    })

            saved_data = []
            errors = []
            for row in csv_data:
                sex_value = row['sex']
                hemiarthroplasty = parse_int(row['Hemiarthroplasty'])
                anatomic_total_shoulder_arthroplasty = parse_int(row['AnatomicTotalShoulderArthroplasty'])
                reverse_total_shoulder_arthroplasty = parse_int(row['ReverseTotalShoulderArthroplasty'])

                sex, created = Sex.objects.get_or_create(sex=sex_value)

                data = {
                    'sex': sex.id,
                    'Hemiarthroplasty': hemiarthroplasty,
                    'AnatomicTotalShoulderArthroplasty': anatomic_total_shoulder_arthroplasty,
                    'ReverseTotalShoulderArthroplasty': reverse_total_shoulder_arthroplasty
                }

                data_serializer = ShoulderArthroplastyRevisionRateBySexSerializer(data=data)

                if data_serializer.is_valid():
                    try:
                        instance = data_serializer.save(sex=sex)
                        saved_data.append(data_serializer.data)
                    except Exception as e:
                        errors.append(str(e))
                else:
                    errors.append(data_serializer.errors)

            return Response({"message": "CSV file processed successfully", "saved_data": saved_data, "errors": errors}, status=status.HTTP_201_CREATED)

        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)

    return Response(file_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
@parser_classes([MultiPartParser, FormParser])
@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
def create_shoulder_arthroplasty_by_age_entry(request):
    file_serializer = FileUploadSerializer(data=request.data)

    if file_serializer.is_valid():
        uploaded_file = file_serializer.save(user=request.user)
        file_path = uploaded_file.file_path.path

        try:
            csv_data = []
            with open(file_path, mode='r', encoding='utf-8-sig') as csv_file:
                csv_reader = csv.reader(csv_file)
                headers = next(csv_reader)  # Skip the header row

                for row in csv_reader:
                    csv_data.append({
                        'agegroup': row[0],
                        'Hemiarthroplasty': row[1],
                        'AnatomicTotalShoulderArthroplasty': row[2],
                        'ReverseTotalShoulderArthroplasty': row[3],
                    })

            saved_data = []
            errors = []
            for row in csv_data:
                agegroup_name = row['agegroup']
                hemiarthroplasty = parse_int(row['Hemiarthroplasty'])
                anatomic_total_shoulder_arthroplasty = parse_int(row['AnatomicTotalShoulderArthroplasty'])
                reverse_total_shoulder_arthroplasty = parse_int(row['ReverseTotalShoulderArthroplasty'])

                age_group, created = AgeGroup.objects.get_or_create(agegroup=agegroup_name)

                data = {
                    'age': age_group.id,
                    'Hemiarthroplasty': hemiarthroplasty,
                    'AnatomicTotalShoulderArthroplasty': anatomic_total_shoulder_arthroplasty,
                    'ReverseTotalShoulderArthroplasty': reverse_total_shoulder_arthroplasty
                }

                data_serializer = ShoulderArthroplastyByAgeSerializer(data=data)

                if data_serializer.is_valid():
                    try:
                        instance = data_serializer.save(age=age_group)
                        saved_data.append(data_serializer.data)
                    except Exception as e:
                        errors.append(str(e))
                else:
                    errors.append(data_serializer.errors)

            return Response({"message": "CSV file processed successfully", "saved_data": saved_data, "errors": errors}, status=status.HTTP_201_CREATED)

        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)

    return Response(file_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
@parser_classes([MultiPartParser, FormParser])
@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
def create_shoulder_arthroplasty_revision_rate_by_age_entry(request):
    file_serializer = FileUploadSerializer(data=request.data)

    if file_serializer.is_valid():
        uploaded_file = file_serializer.save(user=request.user)
        file_path = uploaded_file.file_path.path

        try:
            csv_data = []
            with open(file_path, mode='r', encoding='utf-8-sig') as csv_file:
                csv_reader = csv.reader(csv_file)
                headers = next(csv_reader)  # Skip the header row

                for row in csv_reader:
                    csv_data.append({
                        'agegroup': row[0],
                        'Hemiarthroplasty': row[1],
                        'AnatomicTotalShoulderArthroplasty': row[2],
                        'ReverseTotalShoulderArthroplasty': row[3],
                    })

            saved_data = []
            errors = []
            for row in csv_data:
                agegroup_value = row['agegroup']
                hemiarthroplasty = parse_int(row['Hemiarthroplasty'])
                anatomic_total_shoulder_arthroplasty = parse_int(row['AnatomicTotalShoulderArthroplasty'])
                reverse_total_shoulder_arthroplasty = parse_int(row['ReverseTotalShoulderArthroplasty'])

                agegroup, created = AgeGroup.objects.get_or_create(agegroup=agegroup_value)

                data = {
                    'age': agegroup.id,
                    'Hemiarthroplasty': hemiarthroplasty,
                    'AnatomicTotalShoulderArthroplasty': anatomic_total_shoulder_arthroplasty,
                    'ReverseTotalShoulderArthroplasty': reverse_total_shoulder_arthroplasty
                }

                data_serializer = ShoulderArthroplastyRevisionRateByAgeSerializer(data=data)

                if data_serializer.is_valid():
                    try:
                        instance = data_serializer.save(age=agegroup)
                        saved_data.append(data_serializer.data)
                    except Exception as e:
                        errors.append(str(e))
                else:
                    errors.append(data_serializer.errors)

            return Response({"message": "CSV file processed successfully", "saved_data": saved_data, "errors": errors}, status=status.HTTP_201_CREATED)

        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_400_BAD_REQUEST)

    return Response(file_serializer.errors, status=status.HTTP_400_BAD_REQUEST)





















class FileUploadView(APIView):
    authentication_classes = [SessionAuthentication, TokenAuthentication]
    permission_classes = [IsAuthenticated]

    parser_classes = (MultiPartParser, FormParser)

    def post(self, request, *args, **kwargs):

        file_serializer = FileUploadSerializer(data=request.data)

        if file_serializer.is_valid():

            file = file_serializer.validated_data['file_path']
            print(file)

            uploaded_file = file_serializer.save(user=request.user)
            file_id = uploaded_file.id

            csv_data = []
            with open(uploaded_file.file_path.path, mode='r', encoding='utf-8-sig') as csv_file:
                file_content = csv_file.read().replace('\ufeff', '')
                csv_reader = csv.reader(file_content.splitlines())

                for row in csv_reader:
                    if row[0] != 'Sex' and row[1] != 'Age' and row[2] != 'Indications' and row[3] != 'Prothesis Type':
                        csv_data.append({
                            'sex': row[0],
                            'age': row[1],
                            'indications': row[2],
                            'prothesis_type': row[3],
                        })
            saved_data = []
            errors = []
            for row in csv_data:
                # print(row)
                # print(type(row))
                data_serializer = DataUploadSerializer(data=row)

                if data_serializer.is_valid():
                    try:
                        file_instance = FileUpload.objects.get(id=file_id)
                        instance = data_serializer.save(file=file_instance)
                        saved_data.append(data_serializer.data)
                    except Exception as e:
                        errors.append(str(e))
                else:
                    errors.append(data_serializer.errors)
            if errors:
                return Response({'errors': errors}, status=status.HTTP_400_BAD_REQUEST)
            else:
                return Response({
                    'file_data': saved_data,
                    'file_details': file_serializer.data
                }, status=status.HTTP_201_CREATED)
        else:
            return Response(file_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


