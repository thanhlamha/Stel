**Robot Framework Test Setup and Execution**

This repository contains automated tests written in Robot Framework for testing the functionality of Stel

**Prerequisites**

Before running the tests, ensure you have the following installed:

- Python: Robot Framework requires Python to be installed. Install Python from python.org if you haven't already.
- Robot Framework: Install Robot Framework using pip:
  **pip install robotframework**

**Setup Instructions**

1. Clone the Repository: 
**git clone <>**
**cd <repository_directory>**

3. Install Dependencies:
**pip install -r requirements.txt**
If there's a requirements.txt file that lists additional Python dependencies needed for your tests.

4. Download Additional Libraries: If your tests require additional libraries (e.g., SeleniumLibrary for web testing), install them using pip as well:
   **pip install robotframework-seleniumlibrary**

**Running **
To run the Robot Framework tests:
1. Navigate to the Tests Directory: **cd tests**
2. Execute Robot Framework:
robot --outputdir <expected location> <test file>

Example: **robot --outputdir C:\Users\STEL\Project\Stel\reports C:\Users\STEL\Project\Stel\tests\login\login.robot**

**Viewing Results**
After running the tests, you can view the generated output files:

- XML Output: output.xml (useful for integration with CI/CD pipelines)
- HTML Log: log.html (detailed execution log)
- HTML Report: report.html (summary report of test execution
