from django import forms
from newsapp.models import NewsType,NewsDetails
from django.utils import timezone
from django.conf import settings
from django.core.mail import send_mail
from newsapp.manage import getAllNewsTypes


class NewsTypeForm(forms.ModelForm):
    news_type = forms.CharField(label="Category",label_suffix='*',required = True,widget= forms.TextInput(attrs={'placeholder':'Enter Text Input','pattern':'[A-Za-z ]+'}))
    new_type_display = forms.CharField(label="Category Display",label_suffix='*',required = True,widget= forms.TextInput(attrs={'placeholder':'Enter Type of Display','pattern':'[A-Za-z ]+'}))
    record_start_date = forms.DateField(label='Category Start Date',label_suffix='*',required = True,widget= forms.DateInput(attrs={'type': 'date'}))
    record_end_date = forms.DateField(label="Category End Date",required = False,widget= forms.DateInput(attrs={'type': 'date'}))


    class Meta:
        model = NewsType
        fields = "__all__"


    def clean(self):
        super(NewsTypeForm, self).clean()
        news_type= self.cleaned_data.get('news_type')
        record_start_date = self.cleaned_data.get('record_start_date')
        record_end_date = self.cleaned_data.get('record_end_date')

        # conditions to be met for the news_type length,record start date and end date
        if len(news_type) < 3:
            self._errors['news_type'] = self.error_class(['Minimum 3 characters required'])

        if NewsType.objects.filter(new_type_display=self.cleaned_data['new_type_display']).exists():
            self._errors['new_type_display'] = self.error_class(['This category already exists in DB'])

        if record_start_date < timezone.now().date():
            self._errors['record_start_date'] = self.error_class(['Date should be greater than or equal to currentdate'])

        if record_end_date != None:
            if record_end_date <= record_start_date:
                self._errors['record_end_date'] = self.error_class(['Date should be greater than to Category start date'])
        # return any errors if found
        return self.cleaned_data

class NewsDetailsForm(forms.ModelForm):
    news_header = forms.CharField(max_length=300,label="News Header",required = True,widget= forms.Textarea(attrs={'placeholder':'Enter News Header',"rows":2, "cols":75}))
    news_data = forms.CharField(max_length=500,label="NewsData",required = True,widget= forms.Textarea(attrs={'placeholder':'Enter News Data',"rows":4, "cols":75}))
    news_type = forms.CharField(label="News type",required = True,widget= forms.Select(choices=[(x[0],x[0]) for x in getAllNewsTypes()]))
    news_images_urls=forms.CharField(label="News Image Urls",required = False,widget= forms.TextInput(attrs={'placeholder':'Enter Image urls'}))
    publish_date = forms.DateField(label='Publish Date',label_suffix='*',required = True,widget= forms.DateInput(attrs={'type': 'date'}))
    record_start_date = forms.DateField(label='Record Start Date',label_suffix='*',required = True,widget= forms.DateInput(attrs={'type': 'date'}))
    record_end_date = forms.DateField(label="Record End Date",required = False,widget= forms.DateInput(attrs={'type': 'date'}))


    class Meta:
        model = NewsDetails
        fields = "__all__"


    def clean(self):
        super(NewsDetailsForm, self).clean()
        publish_date= self.cleaned_data.get('publish_date')
        record_start_date = self.cleaned_data.get('record_start_date')
        record_end_date = self.cleaned_data.get('record_end_date')


        if publish_date <= record_start_date:
            self._errors['publish_date'] = self.error_class(['Publish date should be greater'])
        

        if record_start_date < timezone.now().date():
            self._errors['record_start_date'] = self.error_class(['Date should be greater than or equal to currentdate'])
        

        if record_end_date != None:
            if record_end_date <= record_start_date:
                self._errors['record_end_date'] = self.error_class(['Date should be greater than to Category start date'])
            if record_end_date <= publish_date:
                self._errors['publish_date'] = self.error_class(['Publish date should be less than the record end date'])

        return self.cleaned_data


class NewsSearchForm(forms.Form):
    NewsSearch = forms.CharField(label="NewsSearch",label_suffix='*',required = True,widget= forms.TextInput(attrs={'placeholder':'Enter Text Input','pattern':'[A-Za-z ]+'}))
    FromDate = forms.DateField(label='FromDate',label_suffix='*',required = True,widget= forms.DateInput(attrs={'type': 'date'}))
    ToDate = forms.DateField(label="ToDate",required = False,widget= forms.DateInput(attrs={'type': 'date'}))




class NewsDetailsFormUpdate(forms.ModelForm):

    news_header = forms.CharField(max_length=300,label="News Header",required = True,widget= forms.Textarea(attrs={'placeholder':'Enter News Header',"rows":2, "cols":75}))
    news_data = forms.CharField(max_length=500,label="NewsData",required = True,widget= forms.Textarea(attrs={'placeholder':'Enter News Data',"rows":4, "cols":75}))
    news_type = forms.CharField(label="News type",required = True,widget= forms.Select(choices=[(x[0],x[0]) for x in getAllNewsTypes()]))
    news_images_urls=forms.CharField(label="News Image Urls",required = False,widget= forms.TextInput(attrs={'placeholder':'Enter Image urls'}))
    publish_date = forms.DateField(label='Publish Date',label_suffix='*',required = True,validators=[],widget= forms.DateInput(attrs={'type': 'date'}))
    record_start_date = forms.DateField(label='Record Start Date',label_suffix='*',required = True,widget= forms.DateInput(attrs={'type': 'date'}))
    record_end_date = forms.DateField(label="Record End Date",required = False,widget= forms.DateInput(attrs={'type': 'date'}))

    class Meta:
        model = NewsDetails
        fields = "__all__"
    

    def clean(self):
        super(NewsDetailsFormUpdate, self).clean()
        publish_date= self.cleaned_data.get('publish_date')
        record_start_date = self.cleaned_data.get('record_start_date')
        record_end_date = self.cleaned_data.get('record_end_date')


        if publish_date <= record_start_date:
            self._errors['publish_date'] = self.error_class(['Publish date should be greater than or equal to current date'])
        
        if record_start_date < timezone.now().date():
            self._errors['record_start_date'] = self.error_class(['Date should be greater than or equal to currentdate'])
        
        return self.cleaned_data


class NewsTypeFormUpdate(forms.ModelForm):
    news_type = forms.CharField(label="Category",label_suffix='*',required = True,widget= forms.TextInput(attrs={'placeholder':'Enter Text Input','pattern':'[A-Za-z ]+'}))
    new_type_display = forms.CharField(label="Category Display",label_suffix='*',required = True,widget= forms.TextInput(attrs={'placeholder':'Enter Type of Display','pattern':'[A-Za-z ]+'}))
    record_start_date = forms.DateField(label='Category Start Date',label_suffix='*',required = True,widget= forms.DateInput(attrs={'type': 'date'}))
    record_end_date = forms.DateField(label="Category End Date",required = False,widget= forms.DateInput(attrs={'type': 'date'}))


    class Meta:
        model = NewsType
        fields = "__all__"


    def clean(self):
        super(NewsTypeFormUpdate, self).clean()
        news_type= self.cleaned_data.get('news_type')
        record_start_date = self.cleaned_data.get('record_start_date')
        record_end_date = self.cleaned_data.get('record_end_date')

        if len(news_type) < 3:
            self._errors['news_type'] = self.error_class(['Minimum 3 characters required'])

        if record_start_date < timezone.now().date():
            self._errors['record_start_date'] = self.error_class(['Date should be greater than or equal to currentdate'])

        if record_end_date != None:
            if record_end_date <= record_start_date:
                self._errors['record_end_date'] = self.error_class(['Date should be greater than to Category start date'])            

        return self.cleaned_data
