{% macro configure_warehouse(warehouse='transforming', size='XSMALL', auto_suspend=60, generation='1') %}

    {% set settings_sql %}
        alter warehouse {{ warehouse }} set
            warehouse_size = '{{ size }}'
            auto_suspend = {{ auto_suspend }}
            auto_resume = true
    {% endset %}

    {% set generation_sql %}
        alter warehouse {{ warehouse }} set generation = '{{ generation }}'
    {% endset %}

    {% do run_query(settings_sql) %}
    {% do run_query(generation_sql) %}

    {{ log("Configured " ~ warehouse ~ ": size=" ~ size ~ ", auto_suspend=" ~ auto_suspend ~ "s, generation=" ~ generation, info=true) }}

{% endmacro %}