FROM jupyter/base-notebook:notebook-6.0.0

RUN pip install pandas numpy seaborn scikit-learn jupyter-offlinenotebook

RUN mkdir clean_data
RUN mkdir raw_data
COPY --chown=1000:100 clean_data/salaries.csv clean_data
COPY --chown=1000:100 clean_data/churn.csv clean_data
COPY --chown=1000:100 raw_data/raw_churn.csv raw_data
COPY --chown=1000:100 raw_data/raw_salaries.csv raw_data
COPY --chown=1000:100 ["./Optional Challenge 2. KNN - Customer Churn.ipynb", "."]
COPY --chown=1000:100 ["./1. Linear Regression - Salary Predictions.ipynb", "."]

# ./work is found inside official jupyter images, we avoid unnecessary nesting
RUN rm -rf ./work
# moving this line to the bottom to avoid MyBinder build crashing
