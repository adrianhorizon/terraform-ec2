# :point_right: Pendientes :point_left:
- Documentacion
- Test costos: validar que los numero sean correctos
- Test seguridad: correccion de alertas
- Reveer Tags
- version-constraints
- Reveer permisos IAM service user:


# <img src="https://www.datocms-assets.com/58478/1640019487-og-image.png" alt="drawing" width="35"/> Data - IaC Terraform


## Workflow

Realizar **pull** para asegurarse tener el _respositorio local_ actualizado. Ante la necesidad de crear un modulo, servicio o proceder a cambiar algo existe, crear un nuevo **Branch** usando el `TASK ID` en la tarea de _JIRA_. Una vez finalizado los cambios requeridos, es necesario solicitar un **Pull Request (PR)** a **Main** para que se ejecute los test correspondientes, y los aprobadores puedan validar los cambios a pasar (Code Review).
Si el **PR** paso los test, se procede a realizar el **Merge**, este ultimo paso va a realizar un trigger para deployar automaticamente los cambios.
Si el **PR** no paso los test o no se aprueba, se puede mantener abierto para realizar los cambios o cancelar el PR.

![](/images/Workflow.png)

***Nota: Eliminar el branch una vez finalizada y cerrada la tarea en JIRA.***

## IMPORTANTE - Branch Protection
__Use with Branch Protection enabled! [Require status checks before merging](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/about-protected-branches#require-status-checks-before-merging)__. Es necesario que el repositorio tenga habilitada esta configuracion para evitar bypass en el workflow.


## Version tools

| Dependence        | Version           |
| ------------- |:-------------:|
| [aws provider](https://registry.terraform.io/providers/hashicorp/aws/4.2.0)    | `4.2.0` |
| [terraform](https://www.terraform.io/docs)      | `>=1.1.7`      |
| [fsec](https://aquasecurity.github.io/tfsec/v1.6.2/) | `1.6.2`      |
| [ubuntu](https://github.com/actions/virtual-environments) | `20.04`      |

### Commmits

Usamos flags types en los commits para que sea mas facil comprender un cambio, ya sea al momento de realizar code review o tener que revisarlos para debuggear.
_Es importante recordar, siempre es mejor realizar cambios chicos._

- **feat**: Se utiliza para agregar nuevos modulos o servicios,
- **fix**: Modifica o arregla para tener el comportamiento deseado, por ejemplo sumar una CIDR por falta de visibilidad
- **docs**: Todo lo relaciondo a la documentacion. Agregar modificar etcs.
- **style**: Formato en el codigo, indentado, etcs
- **refactor**: Reescribe estructura pero no cambia el comportamiento. Similar al versionado Major.
- **ci**: Cambios o modificaciones relacionados al ci/cd
- **chore**: Todo lo que no este contemplado en lo demas tipos.
