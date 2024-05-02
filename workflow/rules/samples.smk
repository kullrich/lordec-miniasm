import pandas as pd
import re
from snakemake.utils import validate

validate(config, schema="../schemas/config.schema.yaml")

def read_samples():
    samples = (
        pd.read_csv(
            config["samples"],
            sep="\t",
            dtype={"sample_name": str, "group": str},
            comment="#",
        )
        .set_index("sample_name", drop=False)
        .sort_index()
    )
    def _group_or_sample(row):
        group = row.get("group", None)
        if pd.isnull(group):
            return row["sample_name"]
        return group
    samples["group"] = [_group_or_sample(row) for _, row in samples.iterrows()]
    validate(samples, schema="../schemas/samples.schema.yaml")
    return samples

samples = read_samples()
SAMPLES = list(sorted(set(samples["sample_name"])))
GROUPS = list(sorted(set(samples["group"])))
CATEGORIES = ["coding", "regulatory", "intronic", "other"]

wildcard_constraints:
    sample="|".join(SAMPLES),
    group="|".join(GROUPS),

def read_units():
    units = (
        pd.read_csv(
            config["units"],
            sep="\t",
            dtype={"sample_name": str, "unit_name": str},
            comment="#",
        )
        .set_index(["sample_name", "unit_name"], drop=False)
        .sort_index()
    )
    validate(units, schema="../schemas/units.schema.yaml")
    return units

units = read_units()
