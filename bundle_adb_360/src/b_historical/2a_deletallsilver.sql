-- Databricks notebook source
-- MAGIC %md
-- MAGIC ### Delete All Silver
-- MAGIC ---
-- MAGIC This notebook deletes the silverdb.
-- MAGIC it needs two parameters:
-- MAGIC * the catalog (default adbws_centralusadb3600121dev)
-- MAGIC * the databasename (default silverdb)

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.widgets.text('catalog', 'adbws_centralusadb3600121dev')
-- MAGIC dbutils.widgets.text('dbname', 'silverdb')

-- COMMAND ----------

-- MAGIC %python
-- MAGIC catalogname = dbutils.widgets.get('catalog')
-- MAGIC dbname = dbutils.widgets.get('dbname')
-- MAGIC spark.conf.set('adb360.curcatalog', catalogname)
-- MAGIC spark.conf.set('adb360.curdbname', dbname)

-- COMMAND ----------

use catalog ${adb360.curcatalog}

-- COMMAND ----------

drop schema if exists ${adb360.curdbname} cascade
