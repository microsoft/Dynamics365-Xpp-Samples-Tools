---
page_type: sample
languages:
- powershell
- yaml
- json
products:
- azure-devops
- dynamics-finance
- dynamics-finance-operations
- dynamics-retail
- dynamics-commerce
- dynamics-scm
description: "Sample Azure DevOps Build Pipeline for X++ solutions (Dynamics 365)"
urlFragment: "update-this-to-unique-url-stub"
---

# Azure DevOps Pipeline Samples for X++

To run X++ build automation on any system outside of X++ development machines (including Azure DevOps hosted agents), [review the documentation on build automation](https://docs.microsoft.com/en-us/dynamics365/fin-ops-core/dev-itpro/dev-tools/hosted-build-automation). This sample contains an Azure DevOps YML and Classic Pipeline JSON to illustrate a basic X++ build pipeline.

## Contents

| File/folder       | Description                                |
|---                |---                                         |
| `xpp-ci.yml`      | A sample YML file for an X++ Git repo for version 10.0.18 or newer. |
| `xpp-ci - 10.0.17 or earlier.yml`      | A sample YML file for an X++ Git repo for version 10.0.17 or earlier. |
| `xpp-classic-ci.json` | Classic pipeline definition to import manually for version 10.0.18 or newer. |
| `xpp-classic-ci - 10.0.17 or earlier.json` | Classic pipeline definition to import manually for version 10.0.17 or earlier. |
| `xpp-classic-ci.ps1`  | PowerShell script to automatically create a classic pipeline definition in your project. |

## Prerequisites

Basic knowledge of the X++ developer workflow and related files such as models, source code XMLs and descriptors, and their relation to X++ binaries and deployable packages.

The samples, although broadly illustrating the build process, are specifically geared towards Azure DevOps and some knowledge of Azure DevOps pipelines is assumed. An Azure DevOps project is required to use these samples.

Finally, these samples depend on tasks from the [Dynamics 365 Finance and Operations Tools](https://marketplace.visualstudio.com/items?itemName=Dyn365FinOps.dynamics365-finops-tools) extension for Azure DevOps. Review the [Azure DevOps documentation](https://docs.microsoft.com/en-us/azure/devops/marketplace/install-extension?view=azure-devops&tabs=browser) on how to install an extension for an organization.

## Setup

- The **xpp-ci.yml** file can be placed inside a Git repository containing X++ source code to setup a build pipeline.
- To setup the classic definition which can work with TFVC (Team Foundation Version Control) as well as Git repositories, import the **xpp-classic-ci.json** file from the pipelines landing page. (See: [Export and Import a Pipeline](https://docs.microsoft.com/en-us/azure/devops/pipelines/create-first-pipeline?view=azure-devops&tabs=java%2Cclassic%2Cbrowser%2Ctfs-2018-2#export-and-import-a-pipeline)). 
- Alternatively you can run the **xpp-classic-ci.ps1** PowerShell script, provide [connection credentials including a PAT token](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=preview-page#create-personal-access-tokens-to-authenticate-access), and follow the script's prompts to create a new pipeline definition in your project. The token requires at least **Build: Read & execute** permissions, as well as **Agent Pools: Read**.

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
