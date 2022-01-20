// Lets start an Ice Cream Cafe!
// Link: https://www.freecodecamp.org/news/javascript-async-await-tutorial-learn-callbacks-promises-async-await-by-making-icecream/

// Store the ingredients
let stock = {
    fruits: ["strawberry", "grapes", "banana", "apple"],
    liquid: ["water", "ice"],
    holder: ["cone", "cup", "stick"],
    toppings: ["chocolate", "peanuts"]
};

// Shop status
// (Change to false to test the reject part of the promise)
let is_shop_open = false;

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

// First Action: Select Fruit
order(2000, () => console.log(`${stock.fruits[0]} was selected.`))

    // Second Action: Production Started
    // (We have to return the result of callback function or it wont work)
    .then( () => {
        return order(0000, () => console.log("Production has Started") );
    })

    // Step 3
    .then(()=>{
        return order(2000, ()=>console.log("Fruit has been chopped"))
    })

    // Step 4
    .then(()=>{
        return order(1000, ()=>console.log(`${stock.liquid[0]} and ${stock.liquid[1]} added`))
    })

    // Step 5
    .then(()=>{
        return order(1000, ()=>console.log("start the machine"))
    })

    // Step 6
    .then(()=>{
        return order(2000, ()=>console.log(`ice cream placed on ${stock.holder[1]}`))
    })

    // Step 7
    .then(() => {
        return order(3000, () => console.log(`${stock.toppings[0]} as toppings`))
    })

    // Step 8
    .then(() => {
        return order(2000, () => console.log("Serve Ice Cream"))
    })

    // Exception
    .catch(() => {
        console.log("Customer left");
    })

    // Finally
    // (Always executes even if the promise is rejected)
    .finally(() => {
        console.log("End of Day");
    })