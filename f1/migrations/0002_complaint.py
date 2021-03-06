# Generated by Django 3.2.9 on 2022-04-04 20:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('f1', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Complaint',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('descirption', models.CharField(max_length=1140)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('modified', models.DateTimeField(auto_now=True)),
                ('status', models.CharField(max_length=140)),
                ('resolved', models.BooleanField(default=False)),
                ('team', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='complaints', to='f1.team')),
            ],
        ),
    ]
