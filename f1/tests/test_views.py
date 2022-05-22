from django.test import TestCase, Client
from django.urls import reverse
from f1.models import Race, Driver, Team, Location
import datetime


class TestViews(TestCase):
    def setUp(self) -> None:
        self.client = Client()
        self.races_url = reverse("races")
        self.drivers_url = reverse("drivers")
        self.constructors_url = reverse("constructors")

    def test_races_get(self):
        location = Location.objects.create(
            name="Location1", city="Zagreb", country="Croatia"
        )

        date1 = datetime.date(2022, 10, 19)
        date2 = datetime.date(2022, 10, 19)

        Race.objects.create(name="TestRace1", location=location, date=date1)
        Race.objects.create(name="TestRace2", location=location, date=date2)

        response = self.client.get(self.races_url)

        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed("races.html")

        self.assertContains(response, '<div class="race-name">TestRace1</div>')
        self.assertContains(response, '<div class="race-name">TestRace2</div>')

    def test_drivers_get(self):

        team = Team.objects.create(name="TestTeam", points=50, id=1)

        Driver.objects.create(
            number="11", name="John", last_name="Doe", team=team, points=100
        )

        response = self.client.get(self.drivers_url)

        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed("drivers.html")

        self.assertContains(
            response,
            '<a class="driver-name clickable" href="/admin/f1/driver/11/change/" >John Doe</a>',
        )

        self.assertContains(response, '<div class="driver-number">11</div>')
        self.assertContains(
            response,
            '<a class="driver-team-name clickable" href="/admin/f1/team/1/change/">TestTeam</a>',
        )
        self.assertContains(response, '<div class="driver-points">100</div>')

    def test_constructors_get(self):
        team = Team.objects.create(name="TestTeam", points=50, id=1)

        Driver.objects.create(
            number="11", name="John", last_name="Doe", team=team, points=100
        )

        Driver.objects.create(
            number="12", name="Alice", last_name="Doe", team=team, points=500
        )

        response = self.client.get(self.constructors_url)

        self.assertEqual(response.status_code, 200)
        self.assertTemplateUsed("constructors.html")
        self.assertContains(response, "TestTeam")
        self.assertContains(response, "John Doe")
        self.assertContains(response, "Alice Doe")
