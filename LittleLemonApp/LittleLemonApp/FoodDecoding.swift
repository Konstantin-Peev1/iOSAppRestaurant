import Foundation
import CoreData


    let jsonString = """
    {
      "menu": [
        {
          "title": "Greek Salad",
          "price": 12.99,
          "description": "Our delicious salad is served with Feta cheese and peeled cucumber. Includes tomatoes, onions, olives, salt and oregano in the ingredients.",
          "image": "greekSalad.jpg"
        },
        {
          "title": "Bruschetta",
          "price": 7.99,
          "description": "Delicious grilled bread rubbed with garlic and topped with olive oil and salt. Our Bruschetta includes tomato and cheese.",
          "image": "bruschetta.jpg"
        },
        {
          "title": "Grilled Chicken",
          "price": 15.99,
          "description": "Grilled chicken breast served with rice, vegetables, and a lemon butter sauce.",
          "image": "grilledChicken.jpg"
        },
        {
          "title": "Margherita Pizza",
          "price": 10.99,
          "description": "Classic Margherita pizza topped with fresh tomatoes, mozzarella, and basil.",
          "image": "margheritaPizza.jpg"
        },
        {
          "title": "Spaghetti Carbonara",
          "price": 14.50,
          "description": "Traditional Italian pasta dish made with eggs, cheese, pancetta, and pepper.",
          "image": "carbonara.jpg"
        },
        {
          "title": "Lasagna",
          "price": 13.99,
          "description": "Layered pasta with ground beef, ricotta cheese, marinara sauce, and mozzarella.",
          "image": "lasagna.jpg"
        },
        {
          "title": "Caesar Salad",
          "price": 9.99,
          "description": "Crisp romaine lettuce with Caesar dressing, croutons, and shaved Parmesan cheese.",
          "image": "caesarSalad.jpg"
        },
        {
          "title": "Chicken Parmesan",
          "price": 16.99,
          "description": "Breaded chicken breast topped with marinara sauce and melted mozzarella cheese.",
          "image": "chickenParmesan.jpg"
        },
        {
          "title": "Mushroom Risotto",
          "price": 12.50,
          "description": "Creamy risotto with mushrooms, Parmesan cheese, and white wine.",
          "image": "mushroomRisotto.jpg"
        },
        {
          "title": "Beef Tacos",
          "price": 8.99,
          "description": "Soft tortillas filled with seasoned ground beef, lettuce, cheese, and salsa.",
          "image": "beefTacos.jpg"
        },
        {
          "title": "Fish and Chips",
          "price": 11.99,
          "description": "Crispy battered fish served with French fries and tartar sauce.",
          "image": "fishAndChips.jpg"
        },
        {
          "title": "Chicken Alfredo",
          "price": 14.99,
          "description": "Fettuccine pasta tossed in creamy Alfredo sauce with grilled chicken.",
          "image": "chickenAlfredo.jpg"
        },
        {
          "title": "Vegetable Stir Fry",
          "price": 11.50,
          "description": "Mixed vegetables stir-fried with soy sauce and sesame oil, served with rice.",
          "image": "vegetableStirFry.jpg"
        },
        {
          "title": "BBQ Ribs",
          "price": 17.99,
          "description": "Tender pork ribs coated with BBQ sauce, served with coleslaw and fries.",
          "image": "bbqRibs.jpg"
        }
      ]
    }

    """
    
  
