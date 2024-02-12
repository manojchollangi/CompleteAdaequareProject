from .models import Users
from django import forms


class UsersForm(forms.ModelForm):
    user_name = forms.CharField(label="User Name",required=True,min_length=5, max_length=20,widget= forms.TextInput(attrs={'placeholder':'Enter user name','pattern':'[A-Za-z ]+'}))
    first_name = forms.CharField(label="First Name",required=True,min_length=5,max_length=50,widget= forms.TextInput(attrs={'placeholder':'Enter first name','pattern':'[A-Za-z ]+'}))
    last_name = forms.CharField(label="Last Name",required=True,min_length=5,max_length=50,widget= forms.TextInput(attrs={'placeholder':'Enter last name','pattern':'[A-Za-z ]+'}))
    email = forms.EmailField(label="Email",required=True,min_length=5,max_length=50,widget= forms.TextInput(attrs={'placeholder':'Enter Email id'}))
    password = forms.CharField(label="Password",required=True,min_length=6,max_length=100,widget=forms.PasswordInput(attrs={'placeholder':'Enter your password'}))
    re_enter_password = forms.CharField(label="ReTypePassword",required=True,min_length=6,max_length=100,widget=forms.PasswordInput(attrs={'placeholder':'Enter your password'}))
    cell_number=forms.IntegerField(label="Cell_Number",required=True,widget= forms.TextInput(attrs={'placeholder':'10 digits required'}))

    class Meta:
        model = Users
        fields = "__all__"


    def clean(self):
        super(UsersForm, self).clean()
        user_name= self.cleaned_data.get('user_name')
        email= self.cleaned_data.get('email')
        password= self.cleaned_data.get('password')
        re_enter_password = self.cleaned_data.get('re_enter_password')
        cell_number = self.cleaned_data.get('cell_number')
        
        if Users.objects.filter(user_name=self.cleaned_data['user_name']).exists():
            self._errors['user_name'] = self.error_class(['This Username is  already exists in DB'])

        if Users.objects.filter(email=self.cleaned_data['email']).exists():    
            self._errors['email'] = self.error_class(['This email is  already exists in DB'])

        if Users.objects.filter(cell_number=self.cleaned_data['cell_number']).exists():    
            self._errors['cell_number'] = self.error_class(['This cell_number is  already exists in DB'])

        if re_enter_password != password:
            self._errors['re_enter_password'] = self.error_class(['password and re enter password both should be same'])
        # return any errors if found
        return self.cleaned_data


    

class UsersUpdateForm(forms.ModelForm):
    user_name = forms.CharField(label="User Name",disabled=True,required=True,min_length=5, max_length=20,widget= forms.TextInput(attrs={'placeholder':'Enter user name','pattern':'[A-Za-z ]+'}))
    first_name = forms.CharField(label="First Name",required=True,min_length=5,max_length=50,widget= forms.TextInput(attrs={'placeholder':'Enter first name','pattern':'[A-Za-z ]+'}))
    last_name = forms.CharField(label="Last Name",required=True,min_length=5,max_length=50,widget= forms.TextInput(attrs={'placeholder':'Enter last name','pattern':'[A-Za-z ]+'}))
    email = forms.EmailField(label="Email",required=True,min_length=5,max_length=50,widget= forms.TextInput(attrs={'placeholder':'Enter Email id'}))
    password = forms.CharField(label="Password",required=True,min_length=6,max_length=10,widget=forms.PasswordInput(attrs={'placeholder':'Enter your password'}))
    re_enter_password = forms.CharField(label="ReTypePassword",required=True,min_length=6,max_length=10,widget=forms.PasswordInput(attrs={'placeholder':'Enter your password'}))
    cell_number=forms.IntegerField(label="Cell_Number",required=True,widget= forms.TextInput(attrs={'placeholder':'10 digits required'}))

    class Meta:
        model = Users
        fields = "__all__"
    
    def clean(self):
        super(UsersUpdateForm, self).clean()
        password= self.cleaned_data.get('password')
        re_enter_password = self.cleaned_data.get('re_enter_password')
        cell_number = self.cleaned_data.get('cell_number')    
        

        if re_enter_password!=password:    
            self._errors['re_enter_password'] = self.error_class(["password, re_enter_password should be same"])        
        # return any errors if found
        return self.cleaned_data

class LoginForm(forms.Form):
    user_name = forms.CharField(label="User Name",required=True,min_length=5, max_length=20,widget= forms.TextInput(attrs={'placeholder':'Enter user name','pattern':'[A-Za-z ]+'}))
    password = forms.CharField(label="Password",required=True,min_length=6,max_length=10,widget=forms.PasswordInput(attrs={'placeholder':'Enter your password'}))
    def clean(self):
        super(LoginForm, self).clean()
        email = self.cleaned_data.get('email')
        password= self.cleaned_data.get('password')
    


class NewUsersForm(forms.ModelForm):
    user_name = forms.CharField(label="user_name",required=True,min_length=5, max_length=20,widget= forms.TextInput(attrs={'placeholder':'Enter user name','pattern':'[A-Za-z ]+'}))
    first_name = forms.CharField(label="first_name",required=True,min_length=5,max_length=50,widget= forms.TextInput(attrs={'placeholder':'Enter first name','pattern':'[A-Za-z ]+'}))
    last_name = forms.CharField(label="last_name",required=True,min_length=5,max_length=50,widget= forms.TextInput(attrs={'placeholder':'Enter last name','pattern':'[A-Za-z ]+'}))
    email = forms.EmailField(label="email",required=True,min_length=5,max_length=50,widget= forms.TextInput(attrs={'placeholder':'Enter Email id'}))
    password = forms.CharField(label="password",required=True,min_length=6,max_length=100,widget=forms.PasswordInput(attrs={'placeholder':'Enter your password'}))
    re_enter_password = forms.CharField(label="re_type_password",required=True,min_length=6,max_length=100,widget=forms.PasswordInput(attrs={'placeholder':'Enter your password'}))
    cell_number=forms.IntegerField(label="cell_number",required=True,widget= forms.TextInput(attrs={'placeholder':'10 digits required'}))

    class Meta:
        model = Users
        fields = "__all__"


    def clean(self):
        super(NewUsersForm, self).clean()
        password= self.cleaned_data.get('password')
        re_enter_password = self.cleaned_data.get('re_enter_password')
        
        
        if re_enter_password != password:
            self._errors['re_enter_password'] = self.error_class(['password and re enter password both should be same'])
        # return any errors if found
        return self.cleaned_data
