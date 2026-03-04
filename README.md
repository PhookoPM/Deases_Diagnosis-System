**Hospital Diagnosis System
**
The Hospital Diagnosis System is a Prolog-based application designed to assist in diagnosing common illnesses based on patient symptoms. The system leverages a knowledge base of symptoms, diseases, and their respective treatments.

Features
Dynamic Diagnosis: The system dynamically adds user symptoms during execution.
Multiple Diseases: It can diagnose several diseases including flu, common cold, and more based on overlapping symptoms.
Treatment Recommendations: The system provides treatment options based on the diagnosed disease.
How to Use
Setup: Copy the Prolog code provided into the SWI-Prolog online IDE at SWISH.
Start the Diagnosis: Run the query:

?- go.

Follow the Prompts: Answer the questions regarding your symptoms with 'yes.' or 'no.'.
Receive Diagnosis and Treatment: After answering the symptoms, the system will provide a diagnosis and recommended treatment.
Testing the System
To ensure the system behaves as expected, you can run various queries. Here are some suggested queries and what you should test:

Basic Queries
Initial Execution:

?- go.

Test by responding with 'yes.' to all flu symptoms and check for diagnosis.
Negative Response:

?- go.

Answer 'no.' to fever but 'yes.' to symptoms of a cold to see if the diagnosis changes correctly.
Differential Diagnosis
Overlap Detection: Check for diseases with shared symptoms.

?- symptom(Patient, fever).

Ensure the system correctly prioritizes the diagnosis based on the most stringent symptoms.

Treatment Logic Verification
Correct Mapping:
After a diagnosis, verify the treatment advice.

?- hypothesis(Patient, flu), treatment(flu, Treatment).

Ensure that the treatment for flu corresponds to "Tamiflu, bed rest, and increased fluid intake."
Additional Test Cases
Test for Mc's condition

?- go.

Answer: Yes to headache, dizziness, chest pain, blurred vision, and nose bleed.
No Symptoms:

?- symptom(Patient, headache), symptom(Patient, cold).

Verify that if no symptoms are present, the diagnosis states that it cannot provide a specific diagnosis.
Suggested Improvements
Enhanced Symptom Queries: Implement a more robust system for querying symptoms, such as allowing multiple tests at once or batch queries to accommodate different patients.

More Diseases: Expand the knowledge base to include more diseases and nuanced symptoms (e.g., differentiating between types of headaches).

User Interface Improvements: Consider creating a graphical interface or a web-based frontend for a better user experience.

Symptom Categories: Implement categorization of symptoms (e.g., mild, moderate, severe) to influence the urgency of the recommendation.

Historical Data: Store past diagnoses and treatments for repeat patients to provide personalized treatment plans.

Contributions
Contributions to the project are welcome! If you have suggestions, improvements, or modifications, please feel free to open an issue or submit a pull request.
