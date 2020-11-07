resource "aws_iam_group" "group_1" {
	name = "group_1"
}

resource "aws_iam_policy_attachment" "attachment_1" {
	name = "attachment_1"
	groups = [aws_iam_group.group_1.name]
	policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user" "user_1" {
	name = "user_1"
}

resource "aws_iam_user" "user_2" {
	name = "user_2"
}


resource "aws_iam_group_membership" "admin_users" {
	name = "membership_1"
	users = [
		"${aws_iam_user.user_1.name}",
		"${aws_iam_user.user_2.name}"

	]
	group = "${aws_iam_group.group_1.name}"
}

