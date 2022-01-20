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
let is_shop_open = true;

// Function: Let Time Pass
function time(ms) {

    // Return a promise whose outcome is based on the shop status
    return new Promise((resolve, reject) => {
        if (is_shop_open) setTimeout(resolve, ms);
        else reject(console.log("Shop is closed"));
    })
}

// Function: Async Kitchen
async function kitchen() {

    try {
        // Wait 2 seconds and then print
        await time(2000)
        console.log(`${stock.fruits[0]} was selected`)

        // Next steps (Similar to using .then() in a traditional promise)
        await time(0000)
        console.log("production has started")

        await time(2000)
        console.log("fruit has been chopped")

        await time(1000)
        console.log(`${stock.liquid[0]} and ${stock.liquid[1]} added`)

        await time(1000)
        console.log("start the machine")

        await time(2000)
        console.log(`ice cream placed on ${stock.holder[1]}`)

        await time(3000)
        console.log(`${stock.toppings[0]} as toppings`)

        await time(2000)
        console.log("Serve Ice Cream")
    }

    catch (error) {
        console.log("Customer left", error);
    }

    finally {
        console.log("Day ended, shop closed");
    }

}

// Kitchen trigger
kitchen();