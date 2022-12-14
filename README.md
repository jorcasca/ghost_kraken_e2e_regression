# Kraken testing in web app

## Requirement

*  [Ghost installed and running](https://ghost.org/docs/install/local/)
*  [Chai assertion](https://www.chaijs.com/guide/installation/)
*  [Kraken](https://thesoftwaredesignlab.github.io/Kraken/)

### NOTE: Ghost needs to be installed from scratch.
The new version used was Ghost version: 5.23.0 and old version was 3.42.

## Steps to run the test

1. Go to the Ghost-Kraken folder.
2. For some reason, kraken is running the first feature it finds. What was done was to leave only the feature we were going to test in the project.
3. Execute tests
    ```sh        
    npm install kraken-node        // in case of error
    npm install -g appium          // in case of error
    npm install chai               // in case of error
    kraken-node run
    ```
4. Watch e2e test running.

## Results

Inside the assets folder are the feature folders. Inside each one you will find screenshots with the format V<version>E<scenario>.png where version corresponds to 1 or 2 according to the one used (1 for higher version of Ghost 4 and 2 for lower version of Ghost 4) and scenario corresponds to the scenario number.

![image](https://user-images.githubusercontent.com/31069035/202920707-2d0b5919-a72d-449f-9635-f0618d20a8ad.png)


## Explanation of code

1. Inside the features folder are the createAccount, register, login, profile, forgot and dashboard features in Gherkin language.

2. Inside the web/step-definitions folder is the index.js file. This file serves as a bridge between our test specification in the .feature and driver files.

3. Inside the web/step-definitions folder is the index.js file. This file serves as a bridge between our test specification in the .feature and driver files.

4. For some reason, kraken is running the first feature it finds. What was done was to leave only the feature we were going to test in the project.

5. In reports are some results of tests.

6. In assets are screenshots of tests. Ex.  
![image](https://user-images.githubusercontent.com/31069035/202920979-4a0db5c1-7583-45cd-ae2f-7d81744fea78.png)

7. To take the screenshots, webdriverIO was used, where in step Then, before performing the validation, a screenshot is taken. Ex. ![image](https://user-images.githubusercontent.com/31069035/202920935-a5ca6217-a1e1-43c2-b260-0ea8417e6b3d.png)

8. In line 4 of .\features\web\step_definitions\step.js you can see and change the version (1 or 2).

## Evidence

### Ghost running
![ghost](evidence/ghost.PNG) 

### Create Account
![createAccount](evidence/createAccount.PNG) 

### Forgot
![forgot](evidence/forgot.PNG) 

### Login
![login](evidence/login.PNG) 

### Dashboard
![dashboard](evidence/dashboard.PNG) 

### Profile
![profile](evidence/profile.PNG) 

#### By students Jorge, Rodolfo, Luis, Steven
