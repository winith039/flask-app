import pytest
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_homepage(client):
    """Test if homepage loads"""
    response = client.get('/')
    assert response.status_code == 200
    assert b"Hello from Flask App 🚀" in response.data  # assuming homepage text

def test_static_file(client):
    """Test if static image is accessible"""
    response = client.get('/static/dp.png')
    assert response.status_code == 200

