# PIN_DevOps

### Pre-requisitos:
**Crear un rol de IAM para ec2**

**Nombre:** ec2-admin-role

**Permisos a asignar:** AdministratorAccess

---

**Crear una policy de IAM**

**Nombre:** Amazon_EBS_CSI_Driver

En la pestaña JSON copiar lo siguiente:
```sh
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:AttachVolume",
        "ec2:CreateSnapshot",
        "ec2:CreateTags",
        "ec2:CreateVolume",
        "ec2:DeleteSnapshot",
        "ec2:DeleteTags",
        "ec2:DeleteVolume",
        "ec2:DescribeInstances",
        "ec2:DescribeSnapshots",
        "ec2:DescribeTags",
        "ec2:DescribeVolumes",
        "ec2:DetachVolume"
      ],
      "Resource": "*"
    }
  ]
}
```

---

**Crear una instancia ec2**

**Name:** Test

**AMI:** Ubuntu Server 24.04 LTS

**Instance type:** t2.micro

**User data:** PIN_DevOps/00_userdata/ec2_user_data.sh

Una vez creada la instancia se le debe asignar el rol "ec2-admin-role" creada anteriormente.

---

### Notas:

Después de instalar el driver ebs, debemos asignarle la policy  “Amazon_EBS_CSI_Driver” creada anteriormente al siguiente rol:

```sh
eksctl-mundoes-cluster-G6-nodegroup
```

Una vez instalado grafana, se deben importar los dashboards 3119 y 6417 
