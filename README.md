# Workforce.com

This is the marketing site at www.workforce.com

## Making Copy Changes

<a href="https://www.loom.com/share/9ece7f69f83944f89bb438bf68439be9"> <p>Watch this to get started!</p> <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/9ece7f69f83944f89bb438bf68439be9-with-play.gif"> </a>

Making copy changes to the site is a simple process that can safely be completed by anyone.

Most files that you will want to change can be found in App > Views. 

### Some words are special

If you use the word schedule or rota you will need to use <%=  %> around the word. The complete list of these words are:

`<%= schedule %>` will translate to rota in the UK

`<%= schedules %>` will translate to rotas in the UK

`<%= leave_requests %>` will translate to time off request in the UK

These are defined here https://github.com/TandaHQ/workforce-site/blob/master/app/helpers/translation_helper.rb . You can request more words by creating an issue - see below. 

## Issues you can't fix yourself

If you have a bigger problem that you want to raise you can use the issues reporting in Github. 

https://github.com/TandaHQ/workforce-site/issues 


## Entering the Dev Realm

If you want to make more than copy changes, you will need to enter the dev realm. 

