from django.urls import path
from . import views

urlpatterns = [
    path('get_files', views.get_files, name='get_files'),
    path('delete_files/<int:file_id>', views.delete_files, name='delete_files'),
    path('get_data', views.get_data, name='get_data'),
    path('get_trends', views.get_trends, name='get_trends'),
    path('get_trends_by_agerange', views.get_trends_by_agerange, name='get_trends_by_agerange'),
    path('prevalence_by_age_group_and_disease', views.prevalence_by_age_group_and_disease, name='prevalence_by_age_group_and_disease'),
    path('prevalence_of_pathologies', views.prevalence_of_pathologies, name='prevalence_of_pathologies'),
    path('incidence_of_fracture_by_age_group', views.incidence_of_fracture_by_age_group, name='incidence_of_fracture_by_age_group'),
    path('prevalence_by_sex_age_group_prosthesis', views.prevalence_by_sex_age_group_prosthesis, name='prevalence_by_sex_age_group_prosthesis'),
    path('prosthesis_by_indication', views.prosthesis_by_indication, name='prosthesis_by_indication'),

    path('get_rotatorcuff_pathologies_with_counts', views.get_rotatorcuff_pathologies_with_counts, name='get_rotatorcuff_pathologies_with_counts'),
    path('get_prevalence_of_Neer3_by_age_and_sex', views.get_prevalence_of_Neer3_by_age_and_sex, name='get_prevalence_of_Neer3_by_age_and_sex'),
    path('get_shoulder_arthroplasty_by_indication', views.get_shoulder_arthroplasty_by_indication, name='get_shoulder_arthroplasty_by_indication'),
    path('get_reverse_shoulder_arthroplasty_by_indication', views.get_reverse_shoulder_arthroplasty_by_indication, name='get_reverse_shoulder_arthroplasty_by_indication'),
    path('get_shoulder_arthroplasty_by_complication', views.get_shoulder_arthroplasty_by_complication, name='get_shoulder_arthroplasty_by_complication'),
    path('get_shoulder_arthroplasty_by_age', views.get_shoulder_arthroplasty_by_age, name='get_shoulder_arthroplasty_by_age'),
    path('get_shoulder_arthoplasty_revision_rate_by_age', views.get_shoulder_arthoplasty_revision_rate_by_age, name='get_shoulder_arthoplasty_revision_rate_by_age'),
    path('get_shoulder_arthroplasty_by_sex', views.get_shoulder_arthroplasty_by_sex, name='get_shoulder_arthroplasty_by_sex'),
    path('get_shoulder_arthoplasty_revision_rate_by_sex', views.get_shoulder_arthoplasty_revision_rate_by_sex, name='get_shoulder_arthoplasty_revision_rate_by_sex'),
    path('get_hemiarthroplasty_by_age_and_sex', views.get_hemiarthroplasty_by_age_and_sex, name='get_hemiarthroplasty_by_age_and_sex'),
    path('get_hemiarthroplasty_by_indication', views.get_hemiarthroplasty_by_indication, name='get_hemiarthroplasty_by_indication'),
    path('get_anatomic_total_shoulder_arthroplasty_by_age_and_sex', views.get_anatomic_total_shoulder_arthroplasty_by_age_and_sex, name='get_anatomic_total_shoulder_arthroplasty_by_age_and_sex'),
    path('get_reverse_total_shoulder_arthroplasty_by_age_and_sex', views.get_reverse_total_shoulder_arthroplasty_by_age_and_sex, name='get_reverse_total_shoulder_arthroplasty_by_age_and_sex'),
    path('get_prosthesis_company_frequency_by_age_group', views.get_prosthesis_company_frequency_by_age_group, name='get_prosthesis_company_frequency_by_age_group'),
    path('get_prosthesis_company_frequency_by_indication', views.get_prosthesis_company_frequency_by_indication, name='get_prosthesis_company_frequency_by_indication'),
    path('get_revision_rates_of_prosthesis_company_by_indication', views.get_revision_rates_of_prosthesis_company_by_indication, name='get_revision_rates_of_prosthesis_company_by_indication'),
    path('get_prevalence_of_rotatorcuff_pathology_with_comorbidities_by_age_and_sex', views.get_prevalence_of_rotatorcuff_pathology_with_comorbidities_by_age_and_sex, name='get_prevalence_of_rotatorcuff_pathology_with_comorbidities_by_age_and_sex'),
    
    
    
    # path('get_prevalence_by_age/<str:disease_name>/', views.get_prevalence_by_age, name='get_prevalence_by_age'),
]
