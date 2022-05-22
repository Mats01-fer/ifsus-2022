from django.test import TestCase
from http import HTTPStatus
from ..models import Team, Driver, Race

class TeamTestCase(TestCase):
    def setUp(self):
        Team.objects.create(name="TestCase Racing")

    def test_team_get_correctly_initialized(self):
        """Team was successfully created"""
        team = Team.objects.get(name="TestCase Racing")
        self.assertEqual(team.points, 0)
        
    def test_can_add_driver_to_team(self):
        """Team can add driver"""
        team = Team.objects.get(name="TestCase Racing")
        driver = Driver.objects.create(number=101, name="Test", last_name="Case", team=team)
        self.assertEqual(team.drivers.count(), 1)
        
    def test_delete_driver(self):
        """Team can delete driver"""
        team = Team.objects.get(name="TestCase Racing")
        driver = Driver.objects.create(number=101, name="Test", last_name="Case", team=team)
        self.assertEqual(team.drivers.count(), 1)
        driver.delete()
        self.assertEqual(team.drivers.count(), 0)
        
        
        
class AssignPointsFormTests(TestCase):
    def setUp(self):
        Team.objects.create(name="TestCase Racing")
    
    def test_not_unique_drivers(self):
        team = Team.objects.get(name="TestCase Racing")
        
        Race.objects.create(name="GP of TestCase", date='2023-05-20')
        driver = Driver.objects.create(number=102, name="Test", last_name="Case", team=team)
        response = self.client.post("/race-points/1/", data={
            'points_25':driver,
            'points_18':driver,
            'points_15':driver,
            'points_12':driver,
            'points_10':driver,
            'points_8':driver,
            'points_6':driver,
            'points_4':driver,
            'points_2':driver,
            'points_1':driver,
        })

        self.assertEqual(response.status_code, HTTPStatus.OK)
        self.assertContains(
            response, "Niste dobro rasporedili vozače", html=True
        )

    
   