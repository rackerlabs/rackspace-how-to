---
permalink: generate-your-encrypted-key-in-cloud-backup/
audit_date:
title: Generate your encrypted key in Cloud Backup
type: article
created_date: '2012-02-20'
created_by: Rackspace Support
last_modified_date: '2016-04-06'
last_modified_by: Stephanie Fillmon
product: Cloud Backup
product_url: cloud-backup
---

Rackspace Cloud Backup encrypts your passphrase locally on your
browser by using a JavaScript RSA library. Encryption happens before
your passphrase is submitted over the web.

Rackspace will never know your unencrypted (or clear text) passphrase.
Your passphrase is encrypted using public/private key pairs. This is the
SSL web security standard for transmitting data over secure connections.
Only your encrypted passphrase is sent to Rackspace. All communication
between your computer and Rackspace servers for Cloud Backup is done
over SSL, meaning that no one can intercept and read your messages. You
can, however, encrypt your passphrase yourself by using the public/private
key for your system. This method bypasses Rackspace's client-side encryption
library.

Encrypt your passphrase by using the following script:

    #!/usr/bin/env python
    # rcbucrypt.py - Create hex encryption key for API call to set encryption password.
    #
    # WARNING: This code might not work on some operating systems' flavors of python,
    # such as Mac OS-X
    #
    # Example: rcbucrypt.py thisismypassword public-key.pem

    import sys
    import binascii
    from Crypto.PublicKey import RSA
    from Crypto.Cipher import PKCS1_v1_5

    def encrypt(secret, pemfile):
      public_key_path = pemfile
      print public_key_path
      public_key = None
      with open(public_key_path) as f:
        public_key = f.read()

      pkey = RSA.importKey(public_key)
      cipher = PKCS1_v1_5.new(pkey)
      encrypted_password = cipher.encrypt(secret)
      hex_pass = binascii.hexlify(encrypted_password).decode()
      print hex_pass

    def syntax():
      print 'syntax: rcbucrypt  '
      sys.exit(1)

    if (__name__ == "__main__"):
      if (len(sys.argv) == 1):
        syntax()
      secret = sys.argv[1]
      pemfile = sys.argv[2]
      encrypt(secret, pemfile)
