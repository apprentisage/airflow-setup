# Installing AirFlow

If you are setting up from scratch (in AWS ec2, for example), then do the following:

```python
`chmod +x *.sh`
`./airflow-setup.sh`
```

If you already have Anaconda or Miniconda installed, you can simply do the following:

```python
conda env create -f spd.yml
```

To get started, `source activate spd`.

# Installing Postgresql

* Install Postgres
    - `sudo apt-get install postgresql postgresql-contrib`
* Creating a user
    - Create a user: `sudo adduser airflow`
    - Add user to sudo group: `sudo usermod -aG sudo airflow`
    - `su - airflow`
* Creating a db user
    - `sudo -u postgres psql` (in case of permission denial, `sudo su postgres; psql`)
    - `CREATE USER airflow PASSWORD ‘a1rfl0w’;`
    - `CREATE DATABASE airflow;`
    - `GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO airflow;`
    - `\du`
    - `Ctrl+d`
    - Check if database is setup and accessible by the new user: `psql -d airflow`
* Allow connections from the new user (`airflow`)
    - Configure `pg_hba.conf`
        * Open file in editor: `sudo nano /etc/postgresql/9.5/main/pg_hba.conf`
        * After the changes, it should look like:
        ```bash
        # IPv4 local connections:
        host all all 0.0.0.0/0 trust
        ```
        * Restart Service: `sudo service postgresql restart`
    - Configure `postgresql.conf`
        * Open file in editor: `sudo nano /etc/postgresql/9.5/main/postgresql.conf`
        * After the changes, it should look like:
        ```bash
        # — Connection Settings -
        #listen_addresses = ‘localhost’ # what IP address(es) to listen on;
        listen_addresses = ‘*’ # for Airflow connection
        ```
        * Restart the service: `sudo service postgresql restart`

# Getting Started

```bash
cd ~
mkdir airflow
export AIRFLOW_HOME=~/airflow
pip install "[airflow[postgres, mssql, celery, rabbitmq]"
echo AIRFLOW_HOME=~/airflow >> .bashrc
```

## Starting Up Airflow Database

* We can start Airflow’s database by issuing: `airflow initdb`
* The command will generate `airflow.cfg` file in Airflow’s home directory

## Set up airflow.cfg

* Use `CeleryExecutor` instead of `SequentialExecutor` to run the pipeline in the `webUI`: `executor = CeleryExecutor`
* Specify the connection strig for the postgresql database: `sql_alchemy_conn = postgresql+psycopg2://ubuntu@localhost:5432/airflow`
* Save and run: `airflow initdb`

## Disabling Examples

```bash
nano airflow/airflow.cfg
...
# Whether to load the examples that ship with Airflow. It’s good to
# get started, but you probably want to set this to False in a production
# environment
load_examples = False
```

## Starting Airflow Web Server

`airflow webserver` (http://localhost:8080)


# ToDo

* https://github.com/hgrif/airflow-tutorial/blob/master/environment.yml