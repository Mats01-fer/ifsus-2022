from django.test import TestCase
from ..models import Team, Driver

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