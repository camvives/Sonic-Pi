# Welcome to Sonic Pi
use_bpm 145

live_loop :midi_piano do
  use_real_time
  note, velocity = sync "/midi:akm320_0:1/note_on"
  synth :kalimba, note: note, amp: velocity / 20.0
end

#Intro y parte A
use_synth :kalimba
play :a3,  amp: 7, pan: 1, release: 0.05
sleep 1
play :g3,  amp: 7, pan: -1, release: 0.05
sleep 1
play :f3,  amp: 7, pan: 1, release: 0.05
sleep 1
play :e3,  amp: 7, pan: -1, release: 0.05
sleep 1


def kick
  sample :bd_ada, amp: 1, decay: 2
end

def snare(v)
  sample :sn_zome, rate: 1, amp: v*1.5 , slice: 0.0000001
end

live_loop :kick1 do
  kick
  sleep 5
  kick
  sleep 3
end



live_loop :snare do
  vs = [0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0]
  vs.each {
    |v|
    snare(v)
    sleep 1
  }
end


live_loop :hiss do
  sync :kick1
  sample :vinyl_hiss, rate: 0.5, attack: 0.75, release: 0.75
  sleep 20
end

in_thread do
  sleep 20
  sync :kick1
  sample :ambi_lunar_land, amp: 0.1
end


#Parte B
/sample :vinyl_scratch, amp: 0.5
sleep 0.9
sample :vinyl_scratch, amp: 0.5
sleep 1

live_loop :hiss do
  sync :kick1
  sample :vinyl_hiss, rate: 0.5, release: 0.75
  sleep 20
end

def kick
  sample :bd_ada, amp: 1, decay: 2
end

def snare(v)
  sample :sn_zome, rate: 1, amp: v*1.5 , slice: 0.0000001
end

live_loop :kick1 do
  kick
  sleep 5
  kick
  sleep 3
end


live_loop :snare do
  vs = [0,0,1,0, 0,0,1,1, 0,0,1,0, 0,0,1,0]
  vs.each {
    |v|
    snare(v)
    sleep 1
  }
end/



#Estribillo

#live_loop :midi_piano do
#  use_real_time
#  note, velocity = "sync /midi:akm320_0:1/note_on"
#  synth  :dark_ambience, note: note, amp: velocity / 20.0
#end

/def kick
  sample :bd_ada , amp: 1, decay: 2
end

def snare(v)
  sample :sn_zome, rate: 1, amp: v*1.5 , slice: 0.0000001
end

sample :vinyl_scratch, rate: 0.5, amp: 0.3


live_loop :kick1 do
  kick
  sleep 5
  kick
  sleep 0.5
  kick
  sleep 2.5
end


live_loop :snare do
  vs = [0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0]
  vs.each {
    |v|
    snare(v)
    sleep 1
  }
end
/


