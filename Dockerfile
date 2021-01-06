FROM jupyter/base-notebook:notebook-6.0.0

RUN pip install pandas numpy seaborn sklearn jupyter-offlinenotebook

# ./work is found inside official jupyter images, we avoid unnecessary nesting
RUN rm -rf ./work

RUN mkdir data
COPY --chown=1000:100 clean_data/salaries.csv clean_data
COPY --chown=1000:100 clean_data/churn.csv clean_data
COPY --chown=1000:100 raw_data/raw_churn.csv raw_data
COPY --chown=1000:100 raw_data/raw_salaries.csv raw_data
COPY --chown=1000:100 ./Instructor\ Livecode.ipynb .
COPY --chown=1000:100 ./2.\ KNN\ -\ Customer\ Churn.ipynb .
COPY --chown=1000:100 ./1.\ Linear\ Regression\ -\ Salary\ Predictions.ipynb .
