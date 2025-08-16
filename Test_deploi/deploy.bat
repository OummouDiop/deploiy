@echo off
echo ================================
echo SCRIPT DE DEPLOIEMENT CALCULATRICE
echo ================================

echo.
echo 1. Installation des dependances Django...
cd "c:\Users\lapto\NKTT\Test_deploi\calculatrice"
pip install -r requirements.txt

echo.
echo 2. Migration de la base de donnees...
python manage.py migrate

echo.
echo 3. Installation des dependances Flutter...
cd "c:\Users\lapto\NKTT\Test_deploi\front"
flutter pub get

echo.
echo 4. Construction de l'APK Android...
flutter build apk --release

echo.
echo ================================
echo DEPLOIEMENT TERMINE !
echo ================================
echo.
echo APK Android cree dans : build\app\outputs\flutter-apk\app-release.apk
echo.
echo PROCHAINES ETAPES :
echo 1. Deployer Django sur Render.com ou Railway.app
echo 2. Mettre a jour l'URL de l'API dans main.dart
echo 3. Reconstruire l'APK
echo 4. Distribuer l'APK via APKPure ou autres plateformes
echo.
pause
