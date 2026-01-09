resource "aws_security_group" "secure_sg" {
    name = "secure-sg"

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["10.0.0.0/16"]
    }
}

resource "aws_iam_policy" "limited_policy" {
    name = "limited-policy"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Effect   = "Allow"
            Action   = [
                "s3:GetObject"
            ]
            Resource = "*"
        }]
    })
}