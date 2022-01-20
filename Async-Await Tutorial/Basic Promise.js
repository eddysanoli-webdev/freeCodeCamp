// Lets start an Ice Cream Cafe!
// Link: https://www.freecodecamp.org/news/javascript-async-await-tutorial-learn-callbacks-promises-async-await-by-making-icecream/

// Store the ingredients
let stock = {
    fruits: ["strawberry", "grapes", "banana", "apple"],
    liquid: ["water", "ice"],
    holder: ["cone", "cup", "stick"],
    toppings: ["chocolate", "peanuts"]
};

let is_shop_open = true;

// Function: Order (Arrow function)
let order = (time, work) => {


    // Return a promise to the customer: We will serve you ice-cream
    // - Resolved: 
    return new Promise((resolve, reject) => {

        if (is_shop_open) {
            
            // Do the work (put in the hours)
            setTimeout(() => {
                resolve( work() );

            // Set the time that the previous task takes
            }, time)
        }
        else {
            reject( console.log("The shop is closed") );
        }
    })

};

// Run Test
order(2000, () => console.log(`${stock.fruits[0]} was selected.`))
