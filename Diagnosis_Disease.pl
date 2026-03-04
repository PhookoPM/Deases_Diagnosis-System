% --- Dynamic Predicates ---
% Allows the program to store and clear user answers during execution
:- dynamic yes/1, no/1.

% --- Main Execution Loop ---
go :-
    undo, % Clear previous session data
    write('--- Hospital Diagnosis System ---'), nl,
    write('What is the patient\'s name? '),
    read(Patient),
    (hypothesis(Patient, Disease) ->
        report(Patient, Disease);
        not_found(Patient)),
    undo. % Clear data after diagnosis

% --- Reporting Logic ---
report(Patient, Disease) :-
    write_list([Patient, ', based on the symptoms, the diagnosis is: ', Disease, '.']), nl,
    treatment(Disease, Advice),
    write_list(['Recommended Treatment: ', Advice]), nl.

not_found(Patient) :-
    write_list(['Sorry ', Patient, ', I cannot reach a specific diagnosis with these symptoms.']), nl.

% --- Diagnostic Rules (Ordered by Complexity: High to Low) ---
% Flu is checked first because it shares symptoms with cold/measles but has the most requirements.

hypothesis(Patient, flu) :-
    symptom(Patient, fever),
    symptom(Patient, headache),
    symptom(Patient, body_ache),
    symptom(Patient, chills),
    symptom(Patient, sore_throat),
    symptom(Patient, runny_nose),
    symptom(Patient, cough),
    symptom(Patient, conjunctivitis).

hypothesis(Patient, german_measles) :-
    symptom(Patient, fever),
    symptom(Patient, headache),
    symptom(Patient, runny_nose),
    symptom(Patient, rash).

hypothesis(Patient, chicken_pox) :-
    symptom(Patient, fever),
    symptom(Patient, chills),
    symptom(Patient, body_ache),
    symptom(Patient, rash).

hypothesis(Patient, common_cold) :-
    symptom(Patient, headache),
    symptom(Patient, sneezing),
    symptom(Patient, sore_throat),
    symptom(Patient, runny_nose),
    symptom(Patient, chills),
    \+ symptom(Patient, fever). % Differentiates cold from flu

hypothesis(Patient, measles) :-
    symptom(Patient, cough),
    symptom(Patient, sneezing),
    symptom(Patient, runny_nose).

hypothesis(Patient, mumps) :-
    symptom(Patient, fever),
    symptom(Patient, swollen_glands).

hypothesis(Patient,highblood) :-
	symptom(Patient,headache),
	symptom(Patient,dizzines),
	symptom(Patient,chest_pains),
    symptom(Patient,blurred_vission),
    symptom(Patient,nose_bleed).


% --- Treatment Knowledge Base --
treatment(flu, 'Tamiflu, bed rest, and increased fluid intake.').
treatment(german_measles, 'Hydration and rest; monitor temperature closely.').
treatment(chicken_pox, 'Calamine lotion, cool baths, and acetaminophen for fever.').
treatment(common_cold, 'Decongestants, Vitamin C, and rest.').
treatment(measles, 'Vitamin A supplements and fluids. Isolation recommended.').
treatment(mumps, 'Warm or cold packs for swollen glands and soft food diet.').
treatment(highblood, 'Reduce Salt (Sodium),Prioritize fruits, vegetables, whole grains, and lean proteins, while avoiding saturated fats, Physical Activity, Weight Management, Limit Alcohol & Caffeine, Quit Smoking').

% --- Symptom & Interaction Logic ---
symptom(P, S) :- verify(P, S).

verify(P, S) :-
    (yes(S) -> true ;
    (no(S) -> fail ;
    ask(P, S))).

% Standard 'read' version for sandboxed environments
ask(P, S) :-
    format('~w, do you have ~w (yes/no)? ', [P, S]),
    read(Response), % User must type 'yes.' or 'no.' (including the period)
    nl,
    ( (Response == yes ; Response == y) ->
        assert(yes(S)) ;
        assert(no(S)), fail).

% --- Utility Functions ---
undo :- retractall(yes(_)), retractall(no(_)).

write_list([]).
write_list([H|T]) :- write(H), write_list(T).
