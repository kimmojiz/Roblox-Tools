const fs = require('fs');
const readline = require('readline')
const chromedriver = require('chromedriver');
const chrome = require('selenium-webdriver/chrome');
const webdriver = require('selenium-webdriver'),
    By = webdriver.By,
    Key = webdriver.Key,
    until = webdriver.until;

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

function generate(length) {
        charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789",
        retVal = "";
    for (var i = 0, n = charset.length; i < length; ++i) {
        retVal += charset.charAt(Math.floor(Math.random() * n));
    }
    return retVal;
}

chrome.setDefaultService(new chrome.ServiceBuilder(chromedriver.path).build());

async function register() {

let driver = await new webdriver.Builder().forBrowser('chrome').build();


    var name = generate(6);
    var password = generate(12);
    
    await driver.get('https://roblox.com');
    await driver.findElement(By.id('MonthDropdown')).sendKeys('Jan', Key.RETURN)
    await driver.findElement(By.id('DayDropdown')).sendKeys('01', Key.RETURN)
    await driver.findElement(By.id('YearDropdown')).sendKeys('2005', Key.RETURN)
    await driver.findElement(By.id('signup-username')).sendKeys(name, Key.RETURN)
    await driver.findElement(By.id('signup-password')).sendKeys(password, Key.RETURN)
    await driver.findElement(By.id('MaleButton')).click()
    await driver.findElement(By.id('signup-button')).click()

    let user = {
        name: name,
        password: password
    };

    fs.readFile('./account.json', 'utf8', (err, data) => {

        if (err) {
            console.log(`Error reading file from disk: ${err}`);
        } else {
    
            const databases = JSON.parse(data);
    
            databases.push(user);
    
            fs.writeFile('./account.json', JSON.stringify(databases, null, 4), (err) => {
                if (err) {
                    console.log(`Error writing file: ${err}`);
                }
            });
        }
    
    });
};

rl.question('[\033[36m+\033[37m] Amount : ', amount => {
    for (i = 0; i < Number(amount); i++) {
        register()
    }
})