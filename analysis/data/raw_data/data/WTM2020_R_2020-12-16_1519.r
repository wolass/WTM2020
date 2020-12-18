#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
data=read.csv('WTM2020_DATA_2020-12-16_1519.csv')
#Setting Labels

label(data$record_id)="Record ID"
label(data$redcap_event_name)="Event Name"
label(data$redcap_data_access_group)="Data Access Group"
label(data$visit_1_timestamp)="Survey Timestamp"
label(data$subject_initials)="Subject Initials"
label(data$patient_surname)="Patient surname"
label(data$patient_name)="Patient name"
label(data$pesel)="PESEL"
label(data$gender)="Gender"
label(data$diagnosis)="Diagnosis"
label(data$surgery)="Expected surgery?"
label(data$random)="Randomization group"
label(data$loc_detail_in_out)="Inner or outer surface?"
label(data$consent_checklist___1)="Consent Checklist (choice=Consent form signed)"
label(data$consent_checklist___2)="Consent Checklist (choice=Patient informed about the study)"
label(data$consent_checklist___3)="Consent Checklist (choice=Data Protection Clarification signed)"
label(data$good_condition)="The patient is in good general condition"
label(data$no_skin_reaction)="No previous skin reactions (contact allergies)"
label(data$no_skin_damage)="No skin damage in the studied area"
label(data$skin_irritation)="Skin irritation"
label(data$skin_redness)="Skin redness"
label(data$edema)="Edema"
label(data$xerosis)="Xerosis (dry skin)"
label(data$epidermal)="Epidermal detachment"
label(data$pruritus)="Pruritus (Itchy skin)"
label(data$skin_condition_photo)="Skin condition - photo"
label(data$sensor_number)="Sensor number "
label(data$sensor_was_applied)="Date and time the sensor was applied"
label(data$sensor_photo_before)="Photo of the sensor before placement"
label(data$change_placement_1)="Did the placement of the sensor change?"
label(data$placement_change_1_date)="Date and time of the placement change"
label(data$placement_change_1_loc)="Localization after placement change"
label(data$placement_change_1_photo)="Perform Photography of the new localization"
label(data$visit_1_complete)="Complete?"
label(data$uhcmc_derm_ctu_adverse_events_log_timestamp)="Survey Timestamp"
label(data$ae1occur)="Did an Adverse Event occur?"
label(data$ae1)="Adverse Event #1: Describe the Adverse Event. "
label(data$ae1onsetdate)="Adverse Event #1: Onset date"
label(data$ae1resolve)="Adverse Event #1: Did it resolve?"
label(data$ae1dateresolved)="Adverse Event #1: Date resolved"
label(data$ae1severity)="Adverse Event #1: Severity "
label(data$ae1relation)="Adverse Event #1: Relationship to treatment"
label(data$ae1expected)="Adverse Event #1: Was it expected or unexpected?"
label(data$ae1sae)="Adverse Event #1: Is it an SAE?"
label(data$ae2occur)="Did another Adverse Event occur? "
label(data$ae2)="Adverse Event #2: Describe the Adverse Event. "
label(data$ae2onsetdate)="Adverse Event #2: Onset date"
label(data$ae2resolve)="Adverse Event #2:Did it resolve? "
label(data$ae2dateresolved)="Adverse Event #2: Date resolved"
label(data$ae2severity)="Adverse Event #2: Severity "
label(data$ae2relation)="Adverse Event #2: Relationship to treatment "
label(data$ae2expected)="Adverse Event #2: Was it expected or unexpected?"
label(data$ae2sae)="Adverse Event #2:Is it an SAE?"
label(data$ae3occur)="Did another Adverse Event occur? "
label(data$ae3)="Adverse Event #3: Describe the Adverse Event. "
label(data$ae3onsetdate)="Adverse Event #3: Onset date "
label(data$ae3resolve)="Adverse Event #3:Did it resolve? "
label(data$ae3dateresolved)="Adverse Event #3: Date resolved"
label(data$ae3severity)="Adverse Event #3: Severity "
label(data$ae3relation)="Adverse Event #3: Relationship to treatment"
label(data$ae3expected)="Adverse Event #3: Was it expected or unexpected?"
label(data$ae3sae)="Adverse Event #3: Is it an SAE?"
label(data$ae4occur)="Did another Adverse Event occur? "
label(data$ae4)="Adverse Event #4: Describe the Adverse Event. "
label(data$ae4onsetdate)="Adverse Event #4: Onset date"
label(data$ae4resolve)="Adverse Event #4: Did it resolve? "
label(data$ae4dateresolved)="Adverse Event #4: Date resolved"
label(data$ae4severity)="Adverse Event #4: Severity "
label(data$ae4relation)="Adverse Event #4: Relationship to treatment "
label(data$ae4expected)="Adverse Event #4: Was it expected or unexpected?"
label(data$ae4sae)="Adverse Event #4: Is it an SAE? "
label(data$ae5occur)="Did another Adverse Event occur? "
label(data$ae5)="Adverse Event #5: Describe the Adverse Event. "
label(data$ae5onsetdate)="Adverse Event #5: Onset date"
label(data$ae5resolve)="Adverse Event #5: Did it resolve? "
label(data$ae5dateresolved)="Adverse Event #5: Date resolved"
label(data$ae5severity)="Adverse Event #5: Severity "
label(data$ae5relation)="Adverse Event #5: Relationship to treatment"
label(data$ae5expected)="Adverse Event #5: Was it expected or unexpected?"
label(data$ae5sae)="Adverse Event #5: Is it an SAE? "
label(data$ae6occur)="Did another Adverse Event occur? "
label(data$ae6)="Adverse Event #6: Describe the Adverse Event. "
label(data$ae6onsetdate)="Adverse Event #6: Onset date"
label(data$ae6resolve)="Adverse Event #6:Did it resolve? "
label(data$ae6dateresolved)="Adverse Event #6: Date resolved"
label(data$ae6severity)="Adverse Event #6: Severity "
label(data$ae6relation)="Adverse Event #6: Relationship to treatment "
label(data$ae6expected)="Adverse Event #6: Was it expected or unexpected?"
label(data$ae6sae)="Adverse Event #6: Is it an SAE? "
label(data$ae7occur)="Did another Adverse Event occur?"
label(data$ae7)="Adverse Event #7: Describe the Adverse Event. "
label(data$ae7onsetdate)="Adverse Event #7:Onset date"
label(data$ae7resolve)="Adverse Event #7:Did it resolve?"
label(data$ae7dateresolved)="Adverse Event #7:Date resolved"
label(data$ae7severity)="Adverse Event #7:Severity "
label(data$ae7relation)="Adverse Event #7: Relationship to treatment"
label(data$ae7expected)="Adverse Event #7: Was it expected or unexpected?"
label(data$ae7sae)="Adverse Event #7:Is it an SAE?"
label(data$ae8occur)="Did another Adverse Event occur?"
label(data$ae8)="Adverse Event #8: Describe the Adverse Event. "
label(data$ae8onsetdate)="Adverse Event #8:Onset date"
label(data$ae8resolve)="Adverse Event #8:Did it resolve?"
label(data$ae8dateresolved)="Adverse Event #8:Date resolved"
label(data$ae8severity)="Adverse Event #8:Severity "
label(data$ae8relation)="Adverse Event #8: Relationship to treatment"
label(data$ae8expected)="Adverse Event #8: Was it expected or unexpected?"
label(data$ae8sae)="Adverse Event #8:Is it an SAE?"
label(data$ae9occur)="Did another Adverse Event occur?"
label(data$ae9)="Adverse Event #9: Describe the Adverse Event. "
label(data$ae9onsetdate)="Adverse Event #9:Onset date"
label(data$ae9resolve)="Adverse Event #9:Did it resolve?"
label(data$ae9dateresolve)="Adverse Event #9:Date resolved"
label(data$ae9severity)="Adverse Event #9:Severity "
label(data$ae9relation)="Adverse Event #9: Relationship to treatment"
label(data$ae9expected)="Adverse Event #9: Was it expected or unexpected?"
label(data$ae9sae)="Adverse Event #9:Is it an SAE?"
label(data$ae10occur)="Did another Adverse Event occur?"
label(data$ae10)="Adverse Event #10: Describe the Adverse Event. "
label(data$ae10onsetdate)="Adverse Event #10:Onset date"
label(data$ae10resolve)="Adverse Event #10:Did it resolve?"
label(data$ae10dateresolve)="Adverse Event #10:Date resolved"
label(data$ae10severity)="Adverse Event #10:Severity "
label(data$ae10relation)="Adverse Event #10: Relationship to treatment"
label(data$ae10expected)="Adverse Event #10: Was it expected or unexpected?"
label(data$ae10sae)="Adverse Event #10:Is it an SAE?"
label(data$ae11occur)="Did another Adverse Event occur?"
label(data$uhcmc_derm_ctu_adverse_events_log_complete)="Complete?"
label(data$visit_2_timestamp)="Survey Timestamp"
label(data$sensor_number_v2)="Sensor number "
label(data$patient_id_v2)="Patient ID"
label(data$sensor_was_removed)="Date and time the sensor was removed"
label(data$skin_irritation_2)="Skin irritation"
label(data$skin_redness_2)="Skin redness"
label(data$edema_2)="Edema"
label(data$xerosis_2)="Xerosis (dry skin)"
label(data$epidermal_2)="Epidermal detachment"
label(data$pruritus_2)="Pruritus (Itchy skin)"
label(data$skin_condition_photo_v2)="Skin condition - photo"
label(data$previous_loc)="Photo of the previous skin localization"
label(data$sensor_photo_after)="Photo of the sensor after use"
label(data$additional_info_freetext)="Additional Information"
label(data$visit_2_complete)="Complete?"
label(data$temperature_patient_card_timestamp)="Survey Timestamp"
label(data$patient_temperature)="Patient body temperature"
label(data$date_and_time_of_measure)="Date and time of measurement"
label(data$patient_temperature_3)="Patient body temperature"
label(data$date_and_time_of_measure_3)="Date and time of measurement"
label(data$patient_temperature_2)="Patient body temperature"
label(data$date_and_time_of_measure_4)="Date and time of measurement"
label(data$patient_temperature_4)="Patient body temperature"
label(data$date_and_time_of_measure_5)="Date and time of measurement"
label(data$patient_temperature_5)="Patient body temperature"
label(data$date_and_time_of_measure_2)="Date and time of measurement"
label(data$patient_temperature_6)="Patient body temperature"
label(data$date_and_time_of_measure_6)="Date and time of measurement"
label(data$temperature_patient_card_complete)="Complete?"
label(data$usability_questionaire_for_patient_timestamp)="Survey Timestamp"
label(data$troublesome)="Was the use of the WARMIE sensor troublesome for you? "
label(data$if_yes_trouble)="If YES, please describe: "
label(data$limited)="Has the use of the sensor limited your activity?"
label(data$if_yes_limited)="If YES, please describe: "
label(data$located)="Where was the sensor located on the body?"
label(data$comfort)="How do you rate the comfort of wearing the WARMIE sensor?"
label(data$hospitalized_again)="Would you like your body temperature to be measured with a temperature sensor if you are hospitalized again?"
label(data$if_no)="If NO, please describe "
label(data$usability_questionaire_for_patient_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_event_name.factor = factor(data$redcap_event_name,levels=c("initial_visit_arm_1","end_of_study_visit_arm_1"))
data$redcap_data_access_group.factor = factor(data$redcap_data_access_group,levels=c("monitor","si"))
data$gender.factor = factor(data$gender,levels=c("1","2","3"))
data$surgery.factor = factor(data$surgery,levels=c("1","2"))
data$random.factor = factor(data$random,levels=c("1","2","3","4"))
data$loc_detail_in_out.factor = factor(data$loc_detail_in_out,levels=c("1","2"))
data$consent_checklist___1.factor = factor(data$consent_checklist___1,levels=c("0","1"))
data$consent_checklist___2.factor = factor(data$consent_checklist___2,levels=c("0","1"))
data$consent_checklist___3.factor = factor(data$consent_checklist___3,levels=c("0","1"))
data$good_condition.factor = factor(data$good_condition,levels=c("1","2"))
data$no_skin_reaction.factor = factor(data$no_skin_reaction,levels=c("1","2"))
data$no_skin_damage.factor = factor(data$no_skin_damage,levels=c("1","2"))
data$skin_irritation.factor = factor(data$skin_irritation,levels=c("0","1","2","3","4"))
data$skin_redness.factor = factor(data$skin_redness,levels=c("0","1","2","3","4"))
data$edema.factor = factor(data$edema,levels=c("0","1","2","3","4"))
data$xerosis.factor = factor(data$xerosis,levels=c("0","1","2","3","4"))
data$epidermal.factor = factor(data$epidermal,levels=c("0","1","2","3","4"))
data$pruritus.factor = factor(data$pruritus,levels=c("0","1","2","3","4"))
data$change_placement_1.factor = factor(data$change_placement_1,levels=c("1","0"))
data$visit_1_complete.factor = factor(data$visit_1_complete,levels=c("0","1","2"))
data$ae1occur.factor = factor(data$ae1occur,levels=c("1","0"))
data$ae1resolve.factor = factor(data$ae1resolve,levels=c("1","2","3"))
data$ae1severity.factor = factor(data$ae1severity,levels=c("1","2","3"))
data$ae1relation.factor = factor(data$ae1relation,levels=c("1","2","3","4","5"))
data$ae1expected.factor = factor(data$ae1expected,levels=c("1","2"))
data$ae1sae.factor = factor(data$ae1sae,levels=c("1","0"))
data$ae2occur.factor = factor(data$ae2occur,levels=c("1","0"))
data$ae2resolve.factor = factor(data$ae2resolve,levels=c("1","2","3"))
data$ae2severity.factor = factor(data$ae2severity,levels=c("1","2","3"))
data$ae2relation.factor = factor(data$ae2relation,levels=c("1","2","3","4","5"))
data$ae2expected.factor = factor(data$ae2expected,levels=c("1","2"))
data$ae2sae.factor = factor(data$ae2sae,levels=c("1","0"))
data$ae3occur.factor = factor(data$ae3occur,levels=c("1","0"))
data$ae3resolve.factor = factor(data$ae3resolve,levels=c("1","2","3"))
data$ae3severity.factor = factor(data$ae3severity,levels=c("1","2","3"))
data$ae3relation.factor = factor(data$ae3relation,levels=c("1","2","3","4","5"))
data$ae3expected.factor = factor(data$ae3expected,levels=c("1","2"))
data$ae3sae.factor = factor(data$ae3sae,levels=c("1","0"))
data$ae4occur.factor = factor(data$ae4occur,levels=c("1","0"))
data$ae4resolve.factor = factor(data$ae4resolve,levels=c("1","2","3"))
data$ae4severity.factor = factor(data$ae4severity,levels=c("1","2","3"))
data$ae4relation.factor = factor(data$ae4relation,levels=c("1","2","3","4","5"))
data$ae4expected.factor = factor(data$ae4expected,levels=c("1","2"))
data$ae4sae.factor = factor(data$ae4sae,levels=c("1","0"))
data$ae5occur.factor = factor(data$ae5occur,levels=c("1","0"))
data$ae5resolve.factor = factor(data$ae5resolve,levels=c("1","2","3"))
data$ae5severity.factor = factor(data$ae5severity,levels=c("1","2","3"))
data$ae5relation.factor = factor(data$ae5relation,levels=c("1","2","3","4","5"))
data$ae5expected.factor = factor(data$ae5expected,levels=c("1","2"))
data$ae5sae.factor = factor(data$ae5sae,levels=c("1","0"))
data$ae6occur.factor = factor(data$ae6occur,levels=c("1","0"))
data$ae6resolve.factor = factor(data$ae6resolve,levels=c("1","2","3"))
data$ae6severity.factor = factor(data$ae6severity,levels=c("1","2","3"))
data$ae6relation.factor = factor(data$ae6relation,levels=c("1","2","3","4","5"))
data$ae6expected.factor = factor(data$ae6expected,levels=c("1","2"))
data$ae6sae.factor = factor(data$ae6sae,levels=c("1","0"))
data$ae7occur.factor = factor(data$ae7occur,levels=c("1","0"))
data$ae7resolve.factor = factor(data$ae7resolve,levels=c("1","2","3"))
data$ae7severity.factor = factor(data$ae7severity,levels=c("1","2","3"))
data$ae7relation.factor = factor(data$ae7relation,levels=c("1","2","3","4","5"))
data$ae7expected.factor = factor(data$ae7expected,levels=c("1","2"))
data$ae7sae.factor = factor(data$ae7sae,levels=c("1","0"))
data$ae8occur.factor = factor(data$ae8occur,levels=c("1","0"))
data$ae8resolve.factor = factor(data$ae8resolve,levels=c("1","2","3"))
data$ae8severity.factor = factor(data$ae8severity,levels=c("1","2","3"))
data$ae8relation.factor = factor(data$ae8relation,levels=c("1","2","3","4","5"))
data$ae8expected.factor = factor(data$ae8expected,levels=c("1","2"))
data$ae8sae.factor = factor(data$ae8sae,levels=c("1","0"))
data$ae9occur.factor = factor(data$ae9occur,levels=c("1","0"))
data$ae9resolve.factor = factor(data$ae9resolve,levels=c("1","2","3"))
data$ae9severity.factor = factor(data$ae9severity,levels=c("1","2","3"))
data$ae9relation.factor = factor(data$ae9relation,levels=c("1","2","3","4","5"))
data$ae9expected.factor = factor(data$ae9expected,levels=c("1","2"))
data$ae9sae.factor = factor(data$ae9sae,levels=c("1","0"))
data$ae10occur.factor = factor(data$ae10occur,levels=c("1","0"))
data$ae10resolve.factor = factor(data$ae10resolve,levels=c("1","2","3"))
data$ae10severity.factor = factor(data$ae10severity,levels=c("1","2","3"))
data$ae10relation.factor = factor(data$ae10relation,levels=c("1","2","3","4","5"))
data$ae10expected.factor = factor(data$ae10expected,levels=c("1","2"))
data$ae10sae.factor = factor(data$ae10sae,levels=c("1","0"))
data$ae11occur.factor = factor(data$ae11occur,levels=c("1","0"))
data$uhcmc_derm_ctu_adverse_events_log_complete.factor = factor(data$uhcmc_derm_ctu_adverse_events_log_complete,levels=c("0","1","2"))
data$skin_irritation_2.factor = factor(data$skin_irritation_2,levels=c("0","1","2","3","4"))
data$skin_redness_2.factor = factor(data$skin_redness_2,levels=c("0","1","2","3","4"))
data$edema_2.factor = factor(data$edema_2,levels=c("0","1","2","3","4"))
data$xerosis_2.factor = factor(data$xerosis_2,levels=c("0","1","2","3","4"))
data$epidermal_2.factor = factor(data$epidermal_2,levels=c("0","1","2","3","4"))
data$pruritus_2.factor = factor(data$pruritus_2,levels=c("0","1","2","3","4"))
data$visit_2_complete.factor = factor(data$visit_2_complete,levels=c("0","1","2"))
data$temperature_patient_card_complete.factor = factor(data$temperature_patient_card_complete,levels=c("0","1","2"))
data$troublesome.factor = factor(data$troublesome,levels=c("1","2"))
data$limited.factor = factor(data$limited,levels=c("1","2"))
data$located.factor = factor(data$located,levels=c("1","2","3","4"))
data$comfort.factor = factor(data$comfort,levels=c("1","2","3","4"))
data$hospitalized_again.factor = factor(data$hospitalized_again,levels=c("1","2"))
data$usability_questionaire_for_patient_complete.factor = factor(data$usability_questionaire_for_patient_complete,levels=c("0","1","2"))

levels(data$redcap_event_name.factor)=c("Initial Visit","End of Study Visit")
levels(data$redcap_data_access_group.factor)=c("Monitor","SI")
levels(data$gender.factor)=c("Male","Female","Unknown")
levels(data$surgery.factor)=c("YES","NO")
levels(data$random.factor)=c("chest - armpit","wrist","thigh","inner arm")
levels(data$loc_detail_in_out.factor)=c("inner","outer")
levels(data$consent_checklist___1.factor)=c("Unchecked","Checked")
levels(data$consent_checklist___2.factor)=c("Unchecked","Checked")
levels(data$consent_checklist___3.factor)=c("Unchecked","Checked")
levels(data$good_condition.factor)=c("YES","NO")
levels(data$no_skin_reaction.factor)=c("YES","NO")
levels(data$no_skin_damage.factor)=c("YES","NO")
levels(data$skin_irritation.factor)=c("0","+/-","+","++","+ + +")
levels(data$skin_redness.factor)=c("0","+/-","+","++","+ + +")
levels(data$edema.factor)=c("0","+/-","+","++","+ + +")
levels(data$xerosis.factor)=c("0","+/-","+","++","+ + +")
levels(data$epidermal.factor)=c("0","+/-","+","++","+ + +")
levels(data$pruritus.factor)=c("0","+/-","+","++","+ + +")
levels(data$change_placement_1.factor)=c("Yes","No")
levels(data$visit_1_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$ae1occur.factor)=c("Yes","No")
levels(data$ae1resolve.factor)=c("Yes","No, it is still present","Unknown")
levels(data$ae1severity.factor)=c("1 = Mild","2 = Moderate","3 = Severe")
levels(data$ae1relation.factor)=c("1 = Unrelated","2 = Unlikely","3 = Possible","4 = Probable","5 = Definite")
levels(data$ae1expected.factor)=c("Expected","Unexpected")
levels(data$ae1sae.factor)=c("Yes","No")
levels(data$ae2occur.factor)=c("Yes","No")
levels(data$ae2resolve.factor)=c("Yes","No, it is still present","Unknown")
levels(data$ae2severity.factor)=c("1 = Mild","2 = Moderate","3 = Severe")
levels(data$ae2relation.factor)=c("1 = Unrelated","2 = Unlikely","3 = Possible","4 = Probable","5 = Definite")
levels(data$ae2expected.factor)=c("Expected","Unexpected")
levels(data$ae2sae.factor)=c("Yes","No")
levels(data$ae3occur.factor)=c("Yes","No")
levels(data$ae3resolve.factor)=c("Yes","No, it is still present","Unknown")
levels(data$ae3severity.factor)=c("1 = Mild","2 = Moderate","3 = Severe")
levels(data$ae3relation.factor)=c("1 = Unrelated","2 = Unlikely","3 = Possible","4 = Probable","5 = Definite")
levels(data$ae3expected.factor)=c("Expected","Unexpected")
levels(data$ae3sae.factor)=c("Yes","No")
levels(data$ae4occur.factor)=c("Yes","No")
levels(data$ae4resolve.factor)=c("Yes","No, it is still present","Unknown")
levels(data$ae4severity.factor)=c("1 = Mild","2 = Moderate","3 = Severe")
levels(data$ae4relation.factor)=c("1 = Unrelated","2 = Unlikely","3 = Possible","4 = Probable","5 = Definite")
levels(data$ae4expected.factor)=c("Expected","Unexpected")
levels(data$ae4sae.factor)=c("Yes","No")
levels(data$ae5occur.factor)=c("Yes","No")
levels(data$ae5resolve.factor)=c("Yes","No, it is still present","Unknown")
levels(data$ae5severity.factor)=c("1 = Mild","2 = Moderate","3 = Severe")
levels(data$ae5relation.factor)=c("1 = Unrelated","2 = Unlikely","3 = Possible","4 = Probable","5 = Definite")
levels(data$ae5expected.factor)=c("Expected","Unexpected")
levels(data$ae5sae.factor)=c("Yes","No")
levels(data$ae6occur.factor)=c("Yes","No")
levels(data$ae6resolve.factor)=c("Yes","No, it is still present","Unknown")
levels(data$ae6severity.factor)=c("1 = Mild","2 = Moderate","3 = Severe")
levels(data$ae6relation.factor)=c("1 = Unrelated","2 = Unlikely","3 = Possible","4 = Probable","5 = Definite")
levels(data$ae6expected.factor)=c("Expected","Unexpected")
levels(data$ae6sae.factor)=c("Yes","No")
levels(data$ae7occur.factor)=c("Yes","No")
levels(data$ae7resolve.factor)=c("Yes","No, it is still present","Unknown")
levels(data$ae7severity.factor)=c("Mild","Moderate","Severe")
levels(data$ae7relation.factor)=c("1 = Unrelated","2 = Unlikely","3 = Possible","4 = Probable","5 = Definite")
levels(data$ae7expected.factor)=c("Expected","Unexpected")
levels(data$ae7sae.factor)=c("Yes","No")
levels(data$ae8occur.factor)=c("Yes","No")
levels(data$ae8resolve.factor)=c("Yes","No, it is still present","Unknown")
levels(data$ae8severity.factor)=c("Mild","Moderate","Severe")
levels(data$ae8relation.factor)=c("1 = Unrelated","2 = Unlikely","3 = Possible","4 = Probable","5 = Definite")
levels(data$ae8expected.factor)=c("Expected","Unexpected")
levels(data$ae8sae.factor)=c("Yes","No")
levels(data$ae9occur.factor)=c("Yes","No")
levels(data$ae9resolve.factor)=c("Yes","No, it is still present","Unknown")
levels(data$ae9severity.factor)=c("Mild","Moderate","Severe")
levels(data$ae9relation.factor)=c("1 = Unrelated","2 = Unlikely","3 = Possible","4 = Probable","5 = Definite")
levels(data$ae9expected.factor)=c("Expected","Unexpected")
levels(data$ae9sae.factor)=c("Yes","No")
levels(data$ae10occur.factor)=c("Yes","No")
levels(data$ae10resolve.factor)=c("Yes","No, it is still present","Unknown")
levels(data$ae10severity.factor)=c("Mild","Moderate","Severe")
levels(data$ae10relation.factor)=c("1 = Unrelated","2 = Unlikely","3 = Possible","4 = Probable","5 = Definite")
levels(data$ae10expected.factor)=c("Expected","Unexpected")
levels(data$ae10sae.factor)=c("Yes","No")
levels(data$ae11occur.factor)=c("Yes","No")
levels(data$uhcmc_derm_ctu_adverse_events_log_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$skin_irritation_2.factor)=c("0","+/-","+","++","+ + +")
levels(data$skin_redness_2.factor)=c("0","+/-","+","++","+ + +")
levels(data$edema_2.factor)=c("0","+/-","+","++","+ + +")
levels(data$xerosis_2.factor)=c("0","+/-","+","++","+ + +")
levels(data$epidermal_2.factor)=c("0","+/-","+","++","+ + +")
levels(data$pruritus_2.factor)=c("0","+/-","+","++","+ + +")
levels(data$visit_2_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$temperature_patient_card_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$troublesome.factor)=c("YES","NO")
levels(data$limited.factor)=c("YES","NO")
levels(data$located.factor)=c("chest - armpit","wrist","thigh","arm")
levels(data$comfort.factor)=c("very good","well","moderate","bad")
levels(data$hospitalized_again.factor)=c("YES","NO")
levels(data$usability_questionaire_for_patient_complete.factor)=c("Incomplete","Unverified","Complete")
