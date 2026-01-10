# 1. Create the IAM Role
resource "aws_iam_role" "ssm_role" {
  name = "devops-bootcamp-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}

# 2. Attach the standard AWS SSM policy to the role
resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# 3. Create the Instance Profile (this is what EC2 actually "wears")
resource "aws_iam_instance_profile" "ssm_instance_profile" {
  name = "devops-ssm-instance-profile"
  role = aws_iam_role.ssm_role.name
}

resource "aws_s3_bucket" "ansible_transfer" {
  bucket = "ansible-transfer-dineshvar" # Use a unique name
  force_destroy = true                  # Allows terraform to delete it even if files are inside
}

resource "aws_iam_role_policy" "s3_access" {
  name = "allow-s3-ansible-transfer"
  role = aws_iam_role.ssm_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:GetObject", "s3:PutObject", "s3:ListBucket"]
        Effect   = "Allow"
        Resource = [
          "arn:aws:s3:::ansible-transfer-dineshvar",
          "arn:aws:s3:::ansible-transfer-dineshvar/*"
        ]
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "ecr_read" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}