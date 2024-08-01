from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class FileUpload(models.Model):
    filename = models.CharField(max_length=255)
    file_path = models.FileField(upload_to='uploads/')
    uploaded_at = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, default=None)

    def __str__(self):
        return self.filename


class DataUpload(models.Model):
    sex = models.CharField(max_length=255)
    age = models.CharField(max_length=255)
    indications = models.CharField(max_length=255)
    prothesis_type = models.CharField(max_length=255)
    uploaded_at = models.DateTimeField(auto_now_add=True)
    file = models.ForeignKey(FileUpload, on_delete=models.CASCADE, default=None)

    # def __str__(self):
    #     return self.sex


class AgeGroup(models.Model):
    agegroup = models.CharField(max_length=10)

    def __str__(self):
        return self.agegroup


class Indication(models.Model):
    indication = models.CharField(max_length=100)

    def __str__(self):
        return self.indication


class Complication(models.Model):
    complication = models.CharField(max_length=100)

    def __str__(self):
        return self.complication


class Sex(models.Model):
    sex = models.CharField(max_length=10)

    def __str__(self):
        return self.sex


class ProsthesisCompanyFrequency(models.Model):
    age_group = models.ForeignKey(AgeGroup, on_delete=models.CASCADE)
    arthrex = models.IntegerField()
    depuy_synthes = models.IntegerField(verbose_name="DePuy Synthes")
    smith_nephew = models.IntegerField(verbose_name="Smith & Nephew")
    stryker = models.IntegerField()
    zimmer_biomet = models.IntegerField(verbose_name="Zimmer Biomet")
    exacthech = models.IntegerField(verbose_name="Exacthech")
    lima = models.IntegerField()
    fx_solution = models.IntegerField()
    enovis_DJO = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name_plural = "Prosthesis Company Frequencies by Age"

    def __str__(self):
        return f"Frequency for {self.age_group}"


class ProsthesisCompanyFrequencyByIndication(models.Model):
    indication = models.ForeignKey(Indication, on_delete=models.CASCADE)
    arthrex = models.IntegerField()
    depuy_synthes = models.IntegerField(verbose_name="DePuy Synthes")
    smith_nephew = models.IntegerField(verbose_name="Smith & Nephew")
    stryker = models.IntegerField()
    zimmer_biomet = models.IntegerField(verbose_name="Zimmer Biomet")
    exacthech = models.IntegerField(verbose_name="Exacthech")
    lima = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name_plural = "Prosthesis Company Frequencies by indication"

    def __str__(self):
        return f"Frequency for {self.indication}"


class RevisionRatesOfProsthesisCompany(models.Model):
    indication = models.ForeignKey(Indication, on_delete=models.CASCADE)
    arthrex = models.IntegerField()
    depuy_synthes = models.IntegerField(verbose_name="DePuy Synthes")
    smith_nephew = models.IntegerField(verbose_name="Smith & Nephew")
    stryker = models.IntegerField()
    zimmer_biomet = models.IntegerField(verbose_name="Zimmer Biomet")
    exacthech = models.IntegerField(verbose_name="Exacthech")
    lima = models.IntegerField()
    fx_solution = models.IntegerField()
    enovis_DJO = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name_plural = "Revision Rate of Prosthesis Company"

    def __str__(self):
        return f"Frequency for {self.indication}"


class HemiarthroplastyByIndication(models.Model):
    indication = models.ForeignKey(Indication, on_delete=models.CASCADE)
    number = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.indication}"


class AnatomicTotalShoulderArthroplastyByIndication(models.Model):
    indication = models.ForeignKey(Indication, on_delete=models.CASCADE)
    number = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.indication}"


class ReverseTotalShoulderArthroplastyByIndication(models.Model):
    indication = models.ForeignKey(Indication, on_delete=models.CASCADE)
    number = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.indication}"


class ShoulderArthroplastyByComplication(models.Model):
    complication = models.ForeignKey(Complication, on_delete=models.CASCADE)
    Hemiarthroplasty = models.IntegerField()
    AnatomicTotalShoulderArthroplasty = models.IntegerField()
    ReverseTotalShoulderArthroplasty = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.complication}"


class ShoulderArthroplastyRevisionRateBySex(models.Model):
    sex = models.ForeignKey(Sex, on_delete=models.CASCADE)
    Hemiarthroplasty = models.IntegerField()
    AnatomicTotalShoulderArthroplasty = models.IntegerField()
    ReverseTotalShoulderArthroplasty = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.sex}"


class ShoulderArthroplastyRevisionRateByAge(models.Model):
    age = models.ForeignKey(AgeGroup, on_delete=models.CASCADE)
    Hemiarthroplasty = models.IntegerField()
    AnatomicTotalShoulderArthroplasty = models.IntegerField()
    ReverseTotalShoulderArthroplasty = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.age}"


class ShoulderArthroplastyBySex(models.Model):
    sex = models.ForeignKey(Sex, on_delete=models.CASCADE)
    Hemiarthroplasty = models.IntegerField()
    AnatomicTotalShoulderArthroplasty = models.IntegerField()
    ReverseTotalShoulderArthroplasty = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.sex}"


class ShoulderArthroplastyByAge(models.Model):
    age = models.ForeignKey(AgeGroup, on_delete=models.CASCADE)
    Hemiarthroplasty = models.IntegerField()
    AnatomicTotalShoulderArthroplasty = models.IntegerField()
    ReverseTotalShoulderArthroplasty = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.age}"


class HemiarthroplastyByAgeAndSex(models.Model):
    sex = models.ForeignKey(Sex, on_delete=models.CASCADE)
    zero_19 = models.IntegerField()
    twenty_39 = models.IntegerField()
    forty_59 = models.IntegerField()
    sixty_79 = models.IntegerField()
    greaterThan_80 = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.sex}"


class AnatomicTotalShoulderArthroplastyByAgeAndSex(models.Model):
    sex = models.ForeignKey(Sex, on_delete=models.CASCADE)
    zero_19 = models.IntegerField()
    twenty_39 = models.IntegerField()
    forty_59 = models.IntegerField()
    sixty_79 = models.IntegerField()
    greaterThan_80 = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.sex}"


class ReverseTotalShoulderArthroplastyByAgeAndSex(models.Model):
    sex = models.ForeignKey(Sex, on_delete=models.CASCADE)
    zero_19 = models.IntegerField()
    twenty_39 = models.IntegerField()
    forty_59 = models.IntegerField()
    sixty_79 = models.IntegerField()
    greaterThan_80 = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.sex}"


class PrevalenceOfNeerThreeOrFour_partProximalHumeralFractureByAgeAndSex(models.Model):
    sex = models.ForeignKey(Sex, on_delete=models.CASCADE)
    zero_19 = models.IntegerField()
    twenty_39 = models.IntegerField()
    forty_59 = models.IntegerField()
    sixty_79 = models.IntegerField()
    greaterThan_80 = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.sex}"


class PrevalenceOfPatientsWithRotatorcuffPathologyWith_GreaterEqual_1_comorbiditieByAgeAndSex(models.Model):
    sex = models.ForeignKey(Sex, on_delete=models.CASCADE)
    zero_19 = models.IntegerField()
    twenty_39 = models.IntegerField()
    forty_59 = models.IntegerField()
    sixty_79 = models.IntegerField()
    greaterThan_80 = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.sex}"
    
class RotatorCuffPathology(models.Model):
    pathologies = models.CharField(max_length=255)
    count = models.IntegerField()
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Frequency for {self.pathologies}"




