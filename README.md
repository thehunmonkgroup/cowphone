# CowPhone #
Call a phone number, say something, get an email with your words in a [cowsay](http://en.wikipedia.org/wiki/Cowsay)

This was a demo used for http://www.cluecon.com/presentation/stupid-things-you-can-do-voip

## Installation  ##

Install [Jester](http://wiki.freeswitch.org/wiki/Jester)

Symlink your cowphone checkout to the Jester profile directory as cowphone, something like:

    ln -s /path/to/cowphone/checkout /usr/local/freeswitch/scripts/jester/profiles/cowphone

Add the phrase file to your language config (probably conf/lang/en/en.xml):

    <X-PRE-PROCESS cmd="include" data="$${base_dir}/scripts/jester/profiles/cowphone/phrases.xml"/>

  *Note: this assumes you're using the deault sounds, otherwise adjust accordingly.*

Add this extension to your dialplan, replacing EMAIL with a valid email address.

    <!-- Internal extension for CowPhone -->
    <extension name="cowphone">
      <condition field="destination_number" expression="^cowphone$" break="on-true">
        <action application="answer"/>  
        <action application="sleep" data="1000"/>
        <action application="lua" data="jester/jester.lua cowphone cowphone EMAIL"/>
        <action application="hangup"/>  
      </condition>
    </extension>

Set up a transfer to that extension.

## Usage ##

Call the number you configured.
Say something.
Hang up.
Enjoy your cowsay.

## Bugs ##

No bugs, only marmots.
