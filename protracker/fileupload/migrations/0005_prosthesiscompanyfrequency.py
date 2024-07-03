# Generated by Django 5.0.4 on 2024-05-16 04:36

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('fileupload', '0004_agegroup'),
    ]

    operations = [
        migrations.CreateModel(
            name='ProsthesisCompanyFrequency',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('arthrex', models.IntegerField()),
                ('depuy_synthes', models.IntegerField(verbose_name='DePuy Synthes')),
                ('smith_nephew', models.IntegerField(verbose_name='Smith & Nephew')),
                ('stryker', models.IntegerField()),
                ('zimmer_biomet', models.IntegerField(verbose_name='Zimmer Biomet')),
                ('exacthech', models.IntegerField(verbose_name='Exacthech')),
                ('lima', models.IntegerField()),
                ('age_group', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='fileupload.agegroup')),
            ],
            options={
                'verbose_name_plural': 'Prosthesis Company Frequencies',
            },
        ),
    ]
