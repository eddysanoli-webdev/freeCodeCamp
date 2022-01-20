// Lets start an Ice Cream Cafe!
// Link: https://www.freecodecamp.org/news/javascript-async-await-tutorial-learn-callbacks-promises-async-await-by-making-icecream/

// Store the ingredients
let stock = {
    fruits: ["strawberry", "grapes", "banana", "apple"],
    liquid: ["water", "ice"],
    holder: ["cone", "cup", "stick"],
    toppings: ["chocolate", "peanuts"]
};



// Function: Order (Arrow function)
let order = (call_production) => {

    console.log("Order placed. Please call production");

    // Callback for production
    call_production();
};

// Function: Production (Arrow function)
let production = () => {
    console.log("Production has started");
};

// Run Test
order(production);
