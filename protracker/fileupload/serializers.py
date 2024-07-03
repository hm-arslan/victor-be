from rest_framework import serializers
from .models import FileUpload, DataUpload, AgeGroup, ProsthesisCompanyFrequency, Indication, Complication, Sex, \
    ProsthesisCompanyFrequencyByIndication, RevisionRatesOfProsthesisCompany, HemiarthroplastyByIndication, \
    AnatomicTotalShoulderArthroplastyByIndication, ReverseTotalShoulderArthroplastyByIndication, \
    ShoulderArthroplastyByComplication, ShoulderArthroplastyRevisionRateBySex, ShoulderArthroplastyRevisionRateByAge, \
    ShoulderArthroplastyBySex, ShoulderArthroplastyByAge, HemiarthroplastyByAgeAndSex, \
    AnatomicTotalShoulderArthroplastyByAgeAndSex, ReverseTotalShoulderArthroplastyByAgeAndSex, \
    PrevalenceOfNeerThreeOrFour_partProximalHumeralFractureByAgeAndSex, \
    PrevalenceOfPatientsWithRotatorcuffPathologyWith_GreaterEqual_1_comorbiditieByAgeAndSex, RotatorCuffPathology


class FileUploadSerializer(serializers.ModelSerializer):
    class Meta:
        model = FileUpload
        fields = ('id', 'filename', 'file_path', 'uploaded_at', 'user_id')


class DataUploadSerializer(serializers.ModelSerializer):
    # file_id = serializers.PrimaryKeyRelatedField(many=True, read_only=True) file_id =
    # serializers.PrimaryKeyRelatedField(queryset=FileUpload.objects.all(), read_only=True)  # Assuming FileUpload is
    # the related model

    class Meta:
        model = DataUpload
        fields = ('id', 'sex', 'age', 'indications', 'prothesis_type', 'uploaded_at', 'file_id')


class AgeGrouperializer(serializers.ModelSerializer):
    class Meta:
        model = AgeGroup
        fields = ('id', 'agegroup')


class IndicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Indication
        fields = ('id', 'indication')


class ComplicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Complication
        fields = ('id', 'complication')


class SexSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sex
        fields = ('id', 'sex')


# PCF ProsthesisCompanyFrequency
class PCFSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProsthesisCompanyFrequency
        fields = (
            'id', 'age_group_id', 'arthrex', 'depuy_synthes', 'smith_nephew', 'stryker', 'zimmer_biomet', 'exacthech',
            'lima', 'uploaded_at')


# ----------------- NEW SERIALIZERS --------------------

class ProsthesisCompanyFrequencyByIndicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProsthesisCompanyFrequencyByIndication
        fields = (
            'id', 'indication_id', 'arthrex', 'depuy_synthes', 'smith_nephew', 'stryker', 'zimmer_biomet', 'exacthech',
            'lima', 'uploaded_at')


class RevisionRatesOfProsthesisCompanySerializer(serializers.ModelSerializer):
    class Meta:
        model = RevisionRatesOfProsthesisCompany
        fields = (
            'id', 'indication_id', 'arthrex', 'depuy_synthes', 'smith_nephew', 'stryker', 'zimmer_biomet', 'exacthech',
            'lima', 'uploaded_at')


class HemiarthroplastyByIndicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = HemiarthroplastyByIndication
        fields = ('id', 'indication_id', 'number', 'uploaded_at')


class AnatomicTotalShoulderArthroplastyByIndicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = AnatomicTotalShoulderArthroplastyByIndication
        fields = ('id', 'indication_id', 'number', 'uploaded_at')


class ReverseTotalShoulderArthroplastyByIndicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReverseTotalShoulderArthroplastyByIndication
        fields = ('id', 'indication_id', 'number', 'uploaded_at')


class ShoulderArthroplastyByComplicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShoulderArthroplastyByComplication
        fields = ('id', 'complication_id', 'Hemiarthroplasty', 'AnatomicTotalShoulderArthroplasty',
                  'ReverseTotalShoulderArthroplasty', 'uploaded_at')


class ShoulderArthroplastyRevisionRateBySexSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShoulderArthroplastyRevisionRateBySex
        fields = (
            'id', 'sex_id', 'Hemiarthroplasty', 'AnatomicTotalShoulderArthroplasty', 'ReverseTotalShoulderArthroplasty',
            'uploaded_at')


class ShoulderArthroplastyRevisionRateByAgeSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShoulderArthroplastyRevisionRateByAge
        fields = (
            'id', 'age_id', 'Hemiarthroplasty', 'AnatomicTotalShoulderArthroplasty', 'ReverseTotalShoulderArthroplasty',
            'uploaded_at')


class ShoulderArthroplastyBySexSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShoulderArthroplastyBySex
        fields = (
            'id', 'sex_id', 'Hemiarthroplasty', 'AnatomicTotalShoulderArthroplasty', 'ReverseTotalShoulderArthroplasty',
            'uploaded_at')


class ShoulderArthroplastyByAgeSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShoulderArthroplastyByAge
        fields = (
            'id', 'age_id', 'Hemiarthroplasty', 'AnatomicTotalShoulderArthroplasty', 'ReverseTotalShoulderArthroplasty',
            'uploaded_at')


class HemiarthroplastyByAgeAndSexSerializer(serializers.ModelSerializer):
    class Meta:
        model = HemiarthroplastyByAgeAndSex
        fields = ('id', 'sex_id', 'zero_19', 'twenty_39', 'forty_59', 'sixty_79', 'greaterThan_80', 'uploaded_at')


class AnatomicTotalShoulderArthroplastyByAgeAndSexSerializer(serializers.ModelSerializer):
    class Meta:
        model = AnatomicTotalShoulderArthroplastyByAgeAndSex
        fields = ('id', 'sex_id', 'zero_19', 'twenty_39', 'forty_59', 'sixty_79', 'greaterThan_80', 'uploaded_at')


class ReverseTotalShoulderArthroplastyByAgeAndSexSerializer(serializers.ModelSerializer):
    class Meta:
        model = ReverseTotalShoulderArthroplastyByAgeAndSex
        fields = ('id', 'sex_id', 'zero_19', 'twenty_39', 'forty_59', 'sixty_79', 'greaterThan_80', 'uploaded_at')


class PrevalenceOfNeerThreeOrFour_partProximalHumeralFractureByAgeAndSexSerializer(serializers.ModelSerializer):
    class Meta:
        model = PrevalenceOfNeerThreeOrFour_partProximalHumeralFractureByAgeAndSex
        fields = ('id', 'sex_id', 'zero_19', 'twenty_39', 'forty_59', 'sixty_79', 'greaterThan_80', 'uploaded_at')


class PrevalenceOfPatientsWithRotatorcuffPathologyWith_GreaterEqual_1_comorbiditieByAgeAndSexSerializer(
    serializers.ModelSerializer):
    class Meta:
        model = PrevalenceOfPatientsWithRotatorcuffPathologyWith_GreaterEqual_1_comorbiditieByAgeAndSex
        fields = ('id', 'sex_id', 'zero_19', 'twenty_39', 'forty_59', 'sixty_79', 'greaterThan_80', 'uploaded_at')

class RotatorCuffPathologySerializer(serializers.ModelSerializer):

    class Meta:
        model = RotatorCuffPathology
        fields = ('id', 'pathologies', 'count', 'uploaded_at')
