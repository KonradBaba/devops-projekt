# Krok 1: Wybierz obraz bazowy - oficjalny obraz Pythona
FROM python:3.9-slim

# Krok 2: Ustaw katalog roboczy wewnątrz kontenera
WORKDIR /app

# Krok 3: Skopiuj plik z zależnościami i je zainstaluj
COPY requirements.txt .
RUN pip install -r requirements.txt

# Krok 4: Skopiuj resztę plików aplikacji
COPY . .

# Krok 5: Uruchom aplikację, gdy kontener wystartuje
CMD ["python", "app.py"]
