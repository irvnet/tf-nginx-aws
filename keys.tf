
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+VIX2T7aZ/uhKyPHOj6LbOBGa2pteQNoa59b/rGlUWL12nmb3zltKHYx47D/HztQVcx1ovtYSkStgdElnR4jaqT6reK1KpUKntEn4vvYbfuYygLjPps6wRUEEz03XnFJK0KFRscNSQqV6mf65mi8eyqz3VzQWtJaCTBH9D3035DtF+5KsALxVh1ZxkHIReYII6t1pfTh0UQvEDCab4EeuGywQyVH8HtTqz3k6ULkmeXWlcIUdxrRKkT0o4qeLW9wN2FXjff8ldinXWijIOwYLWUvimQHn7pz4S4umqykwKHnPcuOPWLZ2dM6oFZQbmv8SPd2xFbdeGOH4XFkZaEbkea7zJpS49/ZE5UdQ2BzvAMokcP6SpedggFQwvEtPZewgi8MO7qOlXp5mhCNiDGmoMsn4Ot3uibSvFED8Fr5dst5EFGe3YdGvvPfCxCvDZIEZ3yu+VkLpZ8KXOPNnZDT5hl8YEbmjz0zPNT/jwqayujeG1+YZmRiL8+5VhNSHHOU= richardirving@Richards-MBP-2"

  tags = {
      proj      = "webserver"
      terraform = true
      env       = "test"
  }

}
