import pytest
from django.urls import reverse


def test_admin_view(client):
    url = reverse("admin:index")
    response = client.get(url)

    assert response.status_code == 302
    assert response.url == "/admin/login/?next=/admin/"


def test_user_list_no_auth(client):
    url = reverse("user-list")
    response = client.get(url)

    assert response.status_code == 403
    assert response.status_text == "Forbidden"


@pytest.mark.django_db
def test_user_list_auth(client, django_user_model):
    url = reverse("user-list")
    django_user_model.objects.create_user(username="username", password="password")
    client.login(username="username", password="password")
    response = client.get(url)

    assert response.status_code == 200
    assert len(response.json())


@pytest.mark.django_db
def test_register_user(client):
    url = reverse("user-list")
    response = client.post(url, {"username": "foo", "password": "bar"}, format="json")

    assert response.status_code == 201
