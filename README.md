# Custom Evidence Generators for RobotFramework

This repository contains examples of custom evidence generators for video and image generation using the Robot Framework. The custom evidence generators allow you to separate and organize the generated evidence by suite and test, making it easier to understand the test results.


### Installation

To install the project, make sure you have Python installed on your machine, and then follow the steps below:

```bash
  $ pip install robotframework
  $ pip install robotframework-seleniumlibrary
  $ pip install --upgrade robotframework-screencaplibrary
  $ pip install allure-robotframework

````


### Usage

To use the custom evidence generators in your own Robot Framework projects, follow these steps:

1 Import the necessary libraries in your Robot Framework test suite:

```bash
  Library           SeleniumLibrary
  Library           ScreenCapLibrary
  Library           AllureLibrary

````
2 Use the provided keywords in your test cases to generate evidence:

```bash
  Generate Test Evidence Video
  Generate Test Evidence Screenshot
  Stop and Save Evidence Video

````
3 Customize the evidence generation as per your requirements by modifying the provided keywords or creating your own.

## Examples

The following examples demonstrate the usage of the custom evidence generators:
### Example 1: Generating Video Evidence

```bash
 *** Test Cases ***
 Example Test 1
    Open Browser    https://www.example.com    chrome
    Generate Test Evidence Video
    Close Browser
    Stop and Save Evidence Video

````
### Example 2: Generating Screenshot Evidence

```bash
*** Test Cases ***
Example Test 2
    Open Browser    https://www.example.com    chrome
    Generate Test Evidence Screenshot
    Close Browser

````

To run the tests, execute the following command:

```bash
  $ robot -d reports ./examples/test.robot
````

After executing the tests, the results will be located in the "reports" folder of the project.

## Contributing

If you would like to contribute to this project, feel free to submit a pull request with your changes or open an issue for any feature requests or bug reports.

## Acknowledgments
This project was inspired by the need to generate customized evidence in video and image format for Robot Framework test automation.
