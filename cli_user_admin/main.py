import os

# I want to make a script that handle management of users so I don't have to use commands
# I hope to include linux user and smb user management too

def print_users(users):
    """ print the user dictionary in a nice way """
    print(users)

def get_users():
    """ opens etc/passwd to grab users on the system """
    users = os.popen("cat /etc/passwd | cut -d: -f1").read()
    users = users.split("\n")
    return users

def admin_panel():
    """ prints and allows interaction with the users """
    char_input = ' '
    while char_input != 'q' : 
        users = get_users()
        print_users(users)
        print("q - quit")
        print("p - print users")
        char_input = input("what operation would you like to execute: ")
        if char_input == 'q':
            print("quiting program")

    return




def main():
    # loop the admin panel
    admin_panel()

if __name__ == "__main__":
    main()
