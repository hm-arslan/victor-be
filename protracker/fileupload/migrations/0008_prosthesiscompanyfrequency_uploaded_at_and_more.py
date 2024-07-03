# Generated by Django 5.0.4 on 2024-05-16 05:39

import datetime
import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('fileupload', '0007_prosthesiscompanyfrequencybyindication_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='prosthesiscompanyfrequency',
            name='uploaded_at',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='prosthesiscompanyfrequencybyindication',
            name='uploaded_at',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='revisionratesofprosthesiscompany',
            name='uploaded_at',
            field=models.DateTimeField(auto_now_add=True, default=datetime.datetime(2024, 5, 16, 5, 39, 53, 79063, tzinfo=datetime.timezone.utc)),
            preserve_default=False,
        ),
    ]