from django.urls import path
from . import views

# FileUploadView

urlpatterns = [
    # path('upload', FileUploadView.as_view(), name='file-upload'),
    path('rotator_cuff_pathologies', views.create_rotator_cuff_pathology, name='create_rotator_cuff_pathology'),
    path('create_prevalence_Neer3_entry', views.create_prevalence_Neer3_entry, name='create_prevalence_Neer3_entry'),
    path('create_anatomic_total_shoulder_arthroplasty_entry', views.create_anatomic_total_shoulder_arthroplasty_entry, name='create_anatomic_total_shoulder_arthroplasty_entry'),
    path('create_shoulder_arthroplasty_by_complication_entry', views.create_shoulder_arthroplasty_by_complication_entry, name='create_shoulder_arthroplasty_by_complication_entry'),
    path('create_shoulder_arthroplasty_revision_rate_by_sex_entry', views.create_shoulder_arthroplasty_revision_rate_by_sex_entry, name='create_shoulder_arthroplasty_revision_rate_by_sex_entry'),
    path('create_shoulder_arthroplasty_revision_rate_by_age_entry', views.create_shoulder_arthroplasty_revision_rate_by_age_entry, name='create_shoulder_arthroplasty_revision_rate_by_age_entry'),
    path('create_shoulder_arthroplasty_by_sex_entry', views.create_shoulder_arthroplasty_by_sex_entry, name='create_shoulder_arthroplasty_by_sex_entry'),
    path('create_shoulder_arthroplasty_by_age_entry', views.create_shoulder_arthroplasty_by_age_entry, name='create_shoulder_arthroplasty_by_age_entry'),
    path('create_reverse_total_shoulder_arthroplasty_by_indication_entry', views.create_reverse_total_shoulder_arthroplasty_by_indication_entry, name='create_reverse_total_shoulder_arthroplasty_by_indication_entry'),
    path('create_hemiarthroplasty_by_age_and_sex_entry', views.create_hemiarthroplasty_by_age_and_sex_entry, name='create_hemiarthroplasty_by_age_and_sex_entry'),
    path('create_anatomic_total_shoulder_arthroplasty_by_age_and_sex_entry', views.create_anatomic_total_shoulder_arthroplasty_by_age_and_sex_entry, name='create_anatomic_total_shoulder_arthroplasty_by_age_and_sex_entry'),
    path('create_reverse_total_shoulder_arthroplasty_by_age_and_sex_entry', views.create_reverse_total_shoulder_arthroplasty_by_age_and_sex_entry, name='create_reverse_total_shoulder_arthroplasty_by_age_and_sex_entry'),
    path('create_prevalence_of_patients_with_rotatorcuff_pathology_greater1_comorbity_entry', views.create_prevalence_of_patients_with_rotatorcuff_pathology_greater1_comorbity_entry, name='create_prevalence_of_patients_with_rotatorcuff_pathology_greater1_comorbity_entry'),
    path('create_hemiarthroplasty_by_indication_entry', views.create_hemiarthroplasty_by_indication_entry, name='create_hemiarthroplasty_by_indication_entry'),
    path('create_prosthesis_company_frequency_by_age_entry', views.create_prosthesis_company_frequency_by_age_entry, name='create_prosthesis_company_frequency_by_age_entry'),
    path('create_prosthesis_company_frequency_by_indication_entry', views.create_prosthesis_company_frequency_by_indication_entry, name='create_prosthesis_company_frequency_by_indication_entry'),
    path('create_revision_rates_of_prosthesis_company_entry', views.create_revision_rates_of_prosthesis_company_entry, name='create_revision_rates_of_prosthesis_company_entry'),
]

