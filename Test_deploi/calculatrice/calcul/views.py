from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
import json

@api_view(['POST'])
def add_numbers(request):
    """
    API endpoint pour additionner deux nombres
    """
    try:
        data = json.loads(request.body)
        number1 = float(data.get('number1', 0))
        number2 = float(data.get('number2', 0))
        
        result = number1 + number2
        
        return Response({
            'number1': number1,
            'number2': number2,
            'result': result,
            'operation': 'addition'
        }, status=status.HTTP_200_OK)
    
    except (ValueError, TypeError, json.JSONDecodeError) as e:
        return Response({
            'error': 'Données invalides. Veuillez fournir deux nombres valides.',
            'details': str(e)
        }, status=status.HTTP_400_BAD_REQUEST)
    
    except Exception as e:
        return Response({
            'error': 'Erreur interne du serveur',
            'details': str(e)
        }, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
