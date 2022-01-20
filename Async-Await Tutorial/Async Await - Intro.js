// Lets start an Ice Cream Cafe!
// Link: https://www.freecodecamp.org/news/javascript-async-await-tutorial-learn-callbacks-promises-async-await-by-making-icecream/

// Promise to ask which topping to use
function toppings_choice() {

    // Return a promise
    return new Promise((resolve, reject) => {

        setTimeout(() => {
            resolve( console.log("Which topping would you like?") );
        }, 3000);
    });
}

// Kitchen function with the async keyword first
async function kitchen() {

    console.log("A");
    console.log("B");
    console.log("C");

    await toppings_choice();

    console.log("D");
    console.log("E");

}

// Trigger the function
kitchen();

console.log("Doing the dishes");
console.log("Cleaning the tables");
console.log("Taking orders");