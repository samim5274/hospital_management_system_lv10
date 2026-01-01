<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class OtpMail extends Mailable
{
    use Queueable, SerializesModels;

    public $otp, $data;
    
    public function __construct($otp,$data)
    {
        $this->otp = $otp;
        $this->data = $data;
    }

    public function build()
    {
        return $this->subject('Password Reset OTP')
                    ->view('email.otp');
    }
}
