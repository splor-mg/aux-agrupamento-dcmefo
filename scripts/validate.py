import scripts.config
import logging
from frictionless import Package, Checklist
import petl

logger = logging.getLogger(__name__)

def validate_package(source_descriptor):
    package = Package(source_descriptor)

    report_fields = ['title', 'rowNumber', 'fieldNumber', 'fieldName', 'description', 'message', 'note']
    errors = [['resource'] + report_fields]
    checklist = Checklist(skip_errors=["blank-label"])

    for resource in package.resources:
        report = resource.validate(checklist)
        data = report.flatten(report_fields)
        table = [report_fields] + data
        table = petl.addfield(table, 'resource', resource.name, 0)
        errors = petl.cat(errors, table)
    if errors.data():
        unique_errors = petl.cut(errors, ["resource", "fieldName", "title", "description", "note"]).distinct().records()
        for row in unique_errors:
            logger.warning(f"{row.resource}: Coluna '{row.fieldName}' | Erro '{row.title}' | Descrição '{row.description}' | Regra '{row.note}'")
    return errors

""" errors = validate_package()
print(petl.look(errors)) """
