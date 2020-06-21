resource "aws_vpc" "main" {
  cidr_block          = "10.1.0.0/16"
  enable_dns_support  = true
  enabe_dns_hostnames = true

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-vpc")
  )
}

resource "aws_internal_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    local.common_tags,
    map("Name", "${local.prefix}-vpc")
  )
}