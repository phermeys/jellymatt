# jellymatt
My own jellyfin container that works for me

Just do a `git clone` into whatever folder you want to run the container from

Modify the volumes as needed for deployment

I originally made my Jellyfin VM from the lscr.io/linuxserver/jellyfin:latest image

It kept crashing out when playing media and then the entire service went wonky

I figured that since my own base install worked fine, then perhaps if I build my own container from scratch it would work better. 

It was working well but ffmpeg wasn't. After a bit of fiddling, it was fixed by updating ffmpeg to most recent version.

Now it's actually showing up in nvidia-smi when it's encoding, and it encodes quickly. Splendid. 
