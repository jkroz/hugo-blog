# hugo-blog

A hugo repo blog.

### 1. INFRA - Terraform

- Play the states in ./terraform folder.
- Here we are serverless infra with:
  - CDN
  - S3
  - LAMBDA@EDGE
  - Optional : ACM / R53

### 2. Continuous Integration

- Add AWS AK/SK/REGION from terraform outputs to github secrets.
- Automatic build: 
  - Push on Master branch trigger a action workflow to deploy new release on CDN.
  - Actions are: 
    - Git clone own Hugo repo
    - Copy files .md & themes
    - Build Hugo
    - Deploy to AWS S3 bucket
    - Clean CDN caches
