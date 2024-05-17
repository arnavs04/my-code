import numpy as np
import pandas as pd
import pickle
import streamlit as st


# loading the saved model
loaded_model = pickle.load(open('D:/Work/Machine Learning/Deploying Machine Learning model/trained_model.sav', 'rb'))


# creating a function for Prediction
def diabetes_prediction(input_data):
    
    # changing the input_data to numpy array
    input_data_as_numpy_array = np.asarray(input_data)

    # reshape the array as we are predicting for one instance
    input_data_reshaped = input_data_as_numpy_array.reshape(1,-1)

    prediction = loaded_model.predict(input_data_reshaped)
    print(prediction)

    if (prediction[0] == 0):
      return 'The person is not diabetic'
    else:
      return 'The person is diabetic'
  
    
  
def main():
    
    
    # giving a title
    st.title('Diabetes Prediction Web App')
    
    # heading
    st.header("Machine Learning")

    # subheading
    st.subheader("Do you have diabetes?")

    # giving details/input/info
    st.info("Give info bro")

    # warning message
    st.warning("Give or I pop")

    # st.write st.error st.markdown st.text
    # st.caption st.latex

    # st.image(filename.jpg or png or svg)

    # Widgets
    st.checkbox("Are you bro?") # st.button also

    st.radio("Whats are your gender: ", ["Male", "Female", "Non-binar", "Prefer not to speak"])

    st.selectbox("Whats are your gender: ", ["Male", "Female", "Non-binar", "Prefer not to speak"])

    st.multiselect("Whats are your gender: ", ["Male", "Female", "Non-binar", "Prefer not to speak"])

    st.select_slider("Whats are your gender: ", ["Male", "Female", "Non-binar", "Prefer not to speak"]) # st.slider also

    ##### Inputsssss

    # number input
    st.number_input("ALmnaknckn") 
    st.date_input()
    st.time_input()

    # Main Inputs
    st.text_area("Enter prompt: ")

    st.file_uploader("Give file bro: ")

    st.color_picker("color")

    st.image("Lol")

    st.progress(80)
    
    # Sidebar
    st.sidebar.header("fkj")
    # Same code for sidebar also

    data = pd.DataFrame()
    st.bar_chart(data)

    # getting the input data from the user
    Pregnancies = st.text_input('Number of Pregnancies')
    Glucose = st.text_input('Glucose Level')
    BloodPressure = st.text_input('Blood Pressure value')
    SkinThickness = st.text_input('Skin Thickness value')
    Insulin = st.text_input('Insulin Level')
    BMI = st.text_input('BMI value')
    DiabetesPedigreeFunction = st.text_input('Diabetes Pedigree Function value')
    Age = st.text_input('Age of the Person')
    

    # code for Prediction
    diagnosis = ''
    
    # creating a button for Prediction
    if st.button('Diabetes Test Result'):
        diagnosis = diabetes_prediction([Pregnancies, Glucose, BloodPressure, SkinThickness, Insulin, BMI, DiabetesPedigreeFunction, Age])
        
        
    st.success(diagnosis)
    

if __name__ == '__main__':
    main()